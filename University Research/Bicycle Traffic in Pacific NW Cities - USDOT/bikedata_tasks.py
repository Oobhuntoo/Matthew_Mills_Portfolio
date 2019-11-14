"""
#University of Idaho, Dept. of Civil Engineering
#Dr. Mike Lowry, US Dept. of Transportation bikeshare research project
#Title: Bikedata Tasks
#Purpose: This is a module that contains all of the required steps to perform the daily aggregation of data scraped from GBFS
#Author: Matthew Mills
#Date: 04/14/2019
"""
import logging

import datetime
from cryptography.fernet import Fernet
import psycopg2
import pandas as pd
import requests
import json
import numpy as np
import os

from pytz import timezone


# =============================================================================
# Functions
# =============================================================================

# This function uses datetime library to create a datetime object whose value is the day prior to the day of runtime
def get_yesterday():
    yesterday_local_time = datetime.datetime.utcnow() - datetime.timedelta(days=1)
    yesterday_local_time = yesterday_local_time.strftime('%Y-%m-%d')
    yesterday_local_time = yesterday_local_time.replace(" ", "")
    yesterday_local_time = yesterday_local_time.replace(":", "")

    return yesterday_local_time

# This function takes as its input a datetime object, and then converts it to midnight epoch time, adds 86400 (the number of 
# seconds in a day) to it and returns both as midnight of the given day and midnight of the next day. These values are used in
# the process of automating data cleaning
def get_times(local_time, city_offset):
    time_vals = [x for x in local_time.split('-')]
    year = int(time_vals[0])
    month = int(time_vals[1])
    day = int(time_vals[2])
    
    start_time = datetime.datetime(year=year, month=month, day=day, tzinfo=datetime.timezone.utc)
    start_time = int(start_time.timestamp() + city_offset * 3600)
    end_time = start_time + 86400
    
    return start_time, end_time

# This function is given a date and returns its epoch timestamp at midnight. It was used in the web app
def get_start_of_day(input_day, city_offset):
    """Returns epoch time 00:00:00am of this day."""
#    time_vals = [x for x in day.split('-')]
#    year = int(time_vals[0])
#    month = int(time_vals[1])
#    day = int(time_vals[2])
    
    year = input_day.year
    month = input_day.month
    day = input_day.day

    start_time = datetime.datetime(year=year, month=month, day=day, tzinfo=datetime.timezone.utc)
    start_time = int(start_time.timestamp() + city_offset * 3600)
   
    return start_time

# This function is given the timestamp of one day and returns only the end time of that day in epoch time. It was 
# used by the web app as well
def get_end_of_day(input_day, city_offset):
    """Returns epoch time 00:00:00am of the next day."""
    start_time = get_start_of_day(input_day, city_offset)
    end_time = start_time + 86400
   
    return end_time

# This function takes as its input a private key and list of credentials - user name, password, host address of database - and
# returns a secure connection to the postgres database and its cursor. Security was also maintained through limiting the access control list
# of IP addresses allowed to open an http or https connection to the database instance. The encryption relies on a Fernet cypher suite.
def open_secure_connection(fernet_bin, credentials_bin):

    try: 
        # Connecting to the database
        with open(fernet_bin, 'rb') as key_file:
            for line in key_file:
                key = line
        
        with open(credentials_bin, 'rb') as cred_file:
            for line in cred_file:
                encrypted_creds = line
        
        cipher_suite = Fernet(key)

        creds = cipher_suite.decrypt(encrypted_creds).decode('ascii')
        cred_list = [x for x in creds.split(',')]
        
        aws_host =cred_list[0]
        aws_port = cred_list[1]
        db = cred_list[2]
        usr = cred_list[3]
        passwd = cred_list[4]
       
        conn = psycopg2.connect(dbname=db, user=usr, password=passwd, host=aws_host, port=aws_port)
        cursor = conn.cursor()
        
        return conn, cursor
    
    except psycopg2.Error as e:
        print(e)
        logging.info(e)
        


# This function commits any residual changes in the cursor and closes the secure connection to the postgres database
def close_secure_connection(conn, cursor):
    try:
        if (conn):
            cursor.close()
            conn.close()
    except psycopg2.Error as e:
        print(e)
        logging.info(e)
  
  
# This function returns all records for a given bike rental company in a given city. It is used in the daily aggregation process        
def query_database_consolidate(conn, cursor, company, city, is_station):

    try: 
        # Construct query.
        if is_station == "free":
            postgreSQL_query = "removed for privacy"
            col_list = ["removed for privacy"]        
        else:
            postgreSQL_query = "removed for privacy"
            col_list = ["removed for privacy"]

        postgreSQL_query = postgreSQL_query.format(company, city)
        cursor.execute(postgreSQL_query)
        df = pd.DataFrame(cursor.fetchall(), columns = col_list)

        return df
    
    except psycopg2.Error as e:
        print(e)
        logging.info(e)

# This function returns all records for a given bike rental company in a given city whose epoch time stamps fall between
# start_time and end_time. It is used in the web app.
def query_database(conn, cursor, company, city, is_station, start_time, end_time, csv_output=None):

    try: 
        # Construct query.
        if is_station == "free":
            postgreSQL_query = "removed for privacy"
            col_list = ["removed for privacy"]        
        else:
            postgreSQL_query = "removed for privacy"
            col_list = ["removed for privacy"]

        postgreSQL_query = postgreSQL_query.format(company, city, start_time, end_time)
        cursor.execute(postgreSQL_query)

        df = pd.DataFrame(cursor.fetchall(), columns = col_list)
        
        if csv_output:
            df.to_csv(csv_output, index=False)

        return df   
    
    except psycopg2.Error as e:
        print(e)
        logging.info(e)      
                    

# This function takes as its input a pandas dataframe of all records from a given bike rental company in a given city for a given day, and removes all
# records whose latitude/longitude coordinates do not differ from those of the records both previous to and after them. This removes
# all redundant data that is irrelevant for the analysis. The process was optimized by creating copies of columns and shifting them by 
# one value in both directions, and then passing the original columns, the columns shifted up, and the columns shifted down to to the vectorized_get_bike_row_status
# functions that would check whether or not change occured. A string value would be returned as either "keep" or "discard", and these values would then
# populate a new column that would be appended to the dataframe. Any row whose new column value was "discard" would be dropped. The cleaned data is 
# returned as a dataframe.
def consolidate_city(raw_data, is_station, city, company):
    
    df_list = []
    # if the dataframe contains data about bicycle traffic
    if is_station == "free":
        
        bike_list = [x for x in raw_data['bike_id'].unique() if x != None]
               
        count = 0
        for bike in bike_list:
            print(bike, count, len(bike_list))
            count += 1
            bike = ''.join(bike)
            
            df2 = raw_data.loc[ raw_data['bike_id'] == bike ]
            
            df2.sort_values(by=['last_updated'], axis=0, ascending=True, inplace=True, kind='quicksort')
            if (len(df2.index) > 2):
                df3 = df2.iloc[1:-1]
				# shift columns in question up and down and pass to vectorized function
                next_lat_col = df2['lat'].shift(-1)[1:-1]
                prev_lat_col = df2['lat'].shift(1)[1:-1]
                next_lon_col = df2['lon'].shift(-1)[1:-1]
                prev_lon_col = df2['lon'].shift(1)[1:-1]
                # vectorized function returns pandas series of string values indicating whether or not to keep their respective rows
                vectorized_get_bike_row_status = np.vectorize(get_bike_row_status)
                status_values = pd.Series(vectorized_get_bike_row_status(df3['lat'].values, prev_lat_col.values, next_lat_col.values, df3['lon'].values, prev_lon_col.values, next_lon_col.values))
                
                startpoint = pd.Series(['keep'])
                endpoint = pd.Series(['keep'])
                status_values_final = pd.concat([startpoint, status_values, endpoint], ignore_index=True)
                df2.insert(0, "status", status_values_final.values, True)
            else:
                keep_list = []
                for i in range(0,len(df2.index)):
                    keep_list.append("keep")
                df2.insert(0, "status", keep_list, True)
            
            df2 = df2.loc[df2['status'] == 'keep']
            df_list.append(df2)
        
    else:
        # if data being analyzed is station status data
        station_list = raw_data['station_id'].unique()
        
        for station in station_list:
            
            station = ''.join(station)
            print(station, city, company, is_station)
            df2 = raw_data.loc[ raw_data['station_id'] == station ]
            df2.sort_values(by=['last_updated'], axis=0, ascending=True, inplace=True, kind='quicksort')
            
            if (len(df2.index) > 2):
                df3 = df2.iloc[1:-1]
				# The columns being analyzed are shifted up and down respectively and passed to the vectorized function along with the original columns
                prev_NBA_col = df2['num_bikes_available'].shift(1)[1:-1]
                prev_NBD_col = df2['num_bikes_disabled'].shift(1)[1:-1]
                prev_NDA_col = df2['num_docks_available'].shift(1)[1:-1]
                prev_II_col = df2['is_installed'].shift(1)[1:-1]
                prev_IR1_col = df2['is_renting'].shift(1)[1:-1]
                prev_IR2_col = df2['is_returning'].shift(1)[1:-1]
                
                vectorized_get_station_row_status = np.vectorize(get_station_row_status)
                status_values = pd.Series(vectorized_get_station_row_status(df3['num_bikes_available'].values, prev_NBA_col.values, df3['num_bikes_disabled'].values, prev_NBD_col.values, df3['num_docks_available'].values, prev_NDA_col.values, df3['is_installed'].values, prev_II_col.values, df3['is_renting'].values, prev_IR1_col.values, df3['is_returning'].values, prev_IR2_col.values))
                
                startpoint = pd.Series(['keep'])
                endpoint = pd.Series(['keep'])
                status_values_final = pd.concat([startpoint, status_values, endpoint], ignore_index=True)
                df2.insert(0, "status", status_values_final.values, True)
            else:
                keep_list = []
                for i in range(0,len(df2.index)):
                    keep_list.append("keep")
                df2.insert(0, "status", keep_list, True)
            # only the rows with a status value of "keep" are retained in the dataframe
            df2 = df2.loc[df2['status'] == 'keep']
			# a default value of 2 is given for the latitude/longitude values which will be retroactively filled in at a later stage
            df2['lat'] = 2
            df2['lon'] = 2
            df2 = df2[['status', 'station_id', 'num_bikes_available', 'num_bikes_disabled', 'num_docks_available', 'is_installed', 'is_renting', 'is_returning', 'company', 'city', 'local_time', 'last_updated', 'lat', 'lon', 'id']]
            df_list.append(df2)  
            

    final_df = pd.concat(df_list)
    final_df = final_df.drop(['status'], axis=1)
    
    return final_df

def get_bike_row_status(current_lat, prev_lat, next_lat, current_lon, prev_lon, next_lon):
    
    lat_term = abs((current_lat - prev_lat) + (current_lat - next_lat))
    lon_term = abs((current_lon - prev_lon) + (current_lon - next_lon))
    
    zero_term = lat_term + lon_term
	# this formula checks if the given number is 0. If so, then the latitude/longitude values are equal, so there was no change in location
    zero_check = int(np.ceil((zero_term ** 2) / (zero_term ** 2 + 1)))

    status_list = ["discard", "keep"]
    val = status_list[zero_check]
    
    return val
    
def get_station_row_status(current_NBA, prev_NBA, current_NBD, prev_NBD, current_NDA, prev_NDA, current_II, prev_II, current_IR1, prev_IR1, current_IR2, prev_IR2):
    
    NBA_term = abs(int(current_NBA) - int(prev_NBA))
    NBD_term = abs(int(current_NBD) - int(prev_NBD))
    NDA_term = abs(int(current_NDA) - int(prev_NDA))
    II_term = abs(int(current_II) - int(prev_II))
    IR1_term = abs(int(current_IR1) - int(prev_IR1))
    IR2_term = abs(int(current_IR2) - int(prev_IR2))
    
    zero_term = NBA_term + NBD_term + NDA_term + II_term + IR1_term + IR2_term
	# this formula checks if the given number is 0. If so, then the rental availability values are equal, so there was no change in the number of rental units
    zero_check = int(np.ceil((zero_term ** 2) / (zero_term ** 2 + 1)))

    status_list = ["discard", "keep"]
    val = status_list[zero_check]
    
    return val

    
# This function takes as its input a dataframe, converts it to a csv file, uploads the csv file to the postgres database
# and then deletes the csv files
def update_database(cursor, conn, final_data, temp_csv_repo, company, city, is_station):
    
    try:
        csv_file_path = "removed for privacy"
        csv_file_path = csv_file_path.format(company, city, is_station)
        # convert dataframe to csv in given folder
        final_data.to_csv(csv_file_path, index=False)
        # construct table name and upload new csv to table
        with open(csv_file_path, 'r') as upload_file:
            next(upload_file)
            if is_station == "removed for privacy":
                table_name = "removed for privacy"
                table_name = table_name.format(company, city)
            else:
                table_name = "removed for privacy"
                table_name = table_name.format(company, city)
                
            cursor.copy_from(upload_file, table_name, sep=',')
            conn.commit()
        # delete csv to avoid taking up space    
        folder = temp_csv_repo
        for the_file in os.listdir(folder):
            file_path = os.path.join(folder, the_file)
            if os.path.isfile(file_path):
                os.unlink(file_path)
                               
    except psycopg2.Error as e:
        print(e)
        logging.info(e)
        
        
# This function deletes are records in the preprocessed table each day after the data is cleaned and aggregated       
def delete_data_consolidate(conn, cursor, company, city, is_station):
    try: 
        if is_station == "free":
            postgreSQL_query = "removed for privacy"
            postgreSQL_query = postgreSQL_query.format(company, city)                    
            cursor.execute(postgreSQL_query)
            conn.commit() 
        else:            
            postgreSQL_query = "removed for privacy"
            postgreSQL_query = postgreSQL_query.format(company, city)                    
            cursor.execute(postgreSQL_query)
            conn.commit()
    
    except psycopg2.Error as e:
        print(e)
        logging.info(e)


# This method runs once a minute to scrape the urls provided by GBFS for bicycle traffic data
def scrape(conn, cursor):
    
    try:
   
        postgreSQL_query = "removed for privacy"
    
        cursor.execute(postgreSQL_query)
        row_list = []
        for el in cursor:
            row_list.append(el)
    
        for itm in row_list:
            company = itm[0].strip()
            city = itm[1].strip()
            url = itm[2].strip()
            print(company,city,url)
            is_station = int(itm[4])
            #print(company,city,is_station)
            
            tz = ""
            with open("removed for privacy") as tz_json:
                tz_data = json.load(tz_json)
                tz = tz_data[city]
    
            try:
                response = requests.get(url)
            except requests.exceptions.ConnectionError as e:
                logging.info(e)
                pass
            except requests.exceptions.ChunkedEncodingError as e:
                logging.info(e)
                pass
            except requests.exceptions.SSLError as e:
                logging.info(e)
                pass
    
            try:
                content_obj = response.json()
            except ValueError as e:
                logging.info(e)
                pass
    
            try:
                last_updated = content_obj["last_updated"]
                data_obj = content_obj["data"]
            
            except KeyError as e:
                logging.info(e)
                pass
                                
            if not is_station:
                
                try:
                    bike_obj = data_obj["bikes"] # The json lib is used to extract the object needed from the URL containing bike data that is contained in the bigger object returned by the requests call
                    local_time = datetime.datetime.fromtimestamp(last_updated, timezone(tz)).strftime('%Y-%m-%d %H:%M')
                    local_time = local_time.replace(" ", "")
                    local_time = local_time.replace(":", "")
                    local_time = local_time.replace("-", "")
                    print(local_time)
                except OSError as e:
                    logging.info(e)
                    pass
                except KeyError as e:
                    logging.info(e)
                    pass

                vehicle_type_name = "" # Different companies call the vehicle type field different labels, so some case by case checking is used to set the reference to that field correctly for this given run of this script for a given company
        
                if company == "lime":
                    vehicle_type_name = "vehicle_type"
        
                if company == "jump":
                    vehicle_type_name = "jump_vehicle_type"
                
                try:
                    for row in bike_obj:
                        bike_id = row["bike_id"]
                        lat = row["lat"]
                        lon = row["lon"]
                        is_reserved = row["is_reserved"]
                        is_disabled = row["is_disabled"]
                        vehicle_type = "bike"
                        if vehicle_type_name != "":
                            vehicle_type = row[vehicle_type_name] # vehicle_type is set to bike by default, in case the company does not report vehicle type. Then, if it was report, vehicle_type is overwritten with whatever it is actually listed as

                        postgreSQL_query = "removed for privacy"
        
                        cursor.execute(postgreSQL_query, (company, city, local_time, bike_id, is_reserved, is_disabled, lat, lon, vehicle_type, last_updated))
                except KeyError as e:
                    logging.info(e)
                    pass

                conn.commit()
    
            else:
        
                try:
        
                    station_obj = data_obj["stations"] # The json lib is used to extract the object needed from the URL containing bike data that is contained in the bigger object returned by the requests call
        
                    local_time = datetime.datetime.fromtimestamp(last_updated, timezone(tz)).strftime('%Y-%m-%d %H:%M')
        
                    local_time = local_time.replace(" ", "")
                    local_time = local_time.replace(":", "")
                    local_time = local_time.replace("-", "")
        
                    #logging.info("Start scrape for " + city + " " + company + " station " + local_time)
        
                except OSError as e:
                    logging.info(e)
                    pass
                except KeyError as e:
                    logging.info(e)
                    pass

                try:
                    for row in station_obj:
                 
                        station_id = row["station_id"]
                        num_bikes_available = row["num_bikes_available"]
                        num_docks_available = row["num_docks_available"]
                        num_bikes_disabled = row["num_bikes_disabled"]
                        is_installed = row["is_installed"]
                        is_renting = row["is_renting"]
                        is_returning = row["is_returning"]
                        
                        postgreSQL_query = "removed for privacy"
        
                        cursor.execute(postgreSQL_query, (company, city, local_time, station_id, num_bikes_available, num_docks_available, num_bikes_disabled, is_installed, is_renting, is_returning, last_updated))
                except KeyError as e:
                    logging.info(e)
                    pass

                conn.commit()
    
    except psycopg2.Error as e:
        print(e)
        
# The latitude/longitude data for each station is given in separate urls. Thus, it is necessary to make a separat process to retroactively backfill the values of the
# lat/lon coordinates of the stations after the daily aggregation, which is accomplished by this function.       
def update_station_lat_lon(conn, cursor, company, city, url):
    
    try:
        response = requests.get(url)
    except requests.exceptions.ConnectionError as e:
        logging.info(e)
        pass
    except requests.exceptions.ChunkedEncodingError as e:
        logging.info(e)
        pass
    except requests.exceptions.SSLError as e:
        logging.info(e)
        pass
    try:
        content_obj = response.json()
    except ValueError as e:
        logging.info(e)
        pass        
    try:
        data_obj = content_obj["data"]
    except KeyError as e:
        logging.info(e)
        pass        
    try:        
        station_obj = data_obj["stations"] # The json lib is used to extract the object needed from the URL containing bike data that is contained in the bigger object returned by the requests call
    except OSError as e:
        logging.info(e)
        pass
    except KeyError as e:
        logging.info(e)
        pass
    
    df = pd.DataFrame(station_obj)
    df = df[['lat', 'lon', 'station_id']]

    station_list = list(df['station_id'])
    
    for station_id in station_list:
        result = df.loc[df['station_id']==station_id, ['lat','lon']]
        lat = float(result['lat'])
        lon = float(result['lon'])
        
        try: 
            print(station_id, lat, lon)
            postgreSQL_query = "removed for privacy"
            postgreSQL_query = postgreSQL_query.format(company,city,lat,lon,station_id)
            print(postgreSQL_query)
            cursor.execute(postgreSQL_query)
        
            conn.commit()
    
        except psycopg2.Error as e:
            print(e)
            logging.info(e)
            