"""
Created on Thu Jun 27 13:51:33 2019
@title: Get Trips
@author: Matthew
@purpose: to mine GPS coordinate datasets generated from bicycle traffic to identify when/where the bicycles stopped and for how long
"""

 
import platform
import sys
import time


from sklearn.cluster import DBSCAN
import pandas as pd


import config
 
 
# =============================================================================
# Functions
# =============================================================================                   

 
def identify_trips_from_trajectories(input_data, csv_output=None):
    """
    This algorithm analyzes GPS trajectories and identifies trips according the the following process:
    1) perform spatial density clustering
    2) search for patterns among cluster values to indicate start_dwell/end_dwell/destination/origin points.
    The spatial density clustering method used is DBSCAN from the scikit-learn library. It is set with a minimum of 2 data points per cluster
    and a cluster range of 100 ft.
    After clustering is performed, the algorithm examines each record i.e. row in the dataframe and determines the trip satus value of that record. 
    Trip status values can be origin, transit, destination, waiting, start_dwell, dwell, or end_dwell. If a wait time is greater than 15 minutes,
    the stop event is labeled as a destination, waiting, origin event. If the wait time is less than or equal to 15 minutes, the stop event
    is labeled as a start_dwell, dwell, end_dwell event. The exact process of labeling a record relies on the record's cluster value and the cluster values of surrounding records
    The when examining a record, the following cases may arise:
        Case 1: there is only one record for a given bike's data. In this case, that single point is labeled as an origin
        Case 2.a: The record has cluster -1 so it is a transit point and it is not the first or last record for that bike in the time period
        Case 2.b.i: The record is the first record of the time period and it has cluster -1 so it is labeled as transit
        Case 2.b.ii.1: The record is the first record of the time period and its cluster is not -1 and its cluster is not equal to the next cluster
                        this indicates that a trip is beginning, so the record is labeled as an origin
        Case 2.b.ii.2: The record is the first record of the time period and its cluster is not -1 and its cluster is equal to the cluster value of the next record
                        This will be labeled by the portion of the algorithm that handles Case 4 so no action is needed
        Case 3.a: The record is the last record of the time period and its cluster value is -1. This means the day ended mid-transit so the record is labeled as a destination
        Case 3.b.i: The record is the last record of the time period and its cluster value is not -1 and it is equal to the cluster value of the previous record. This means the day ended while the bike was 
                    waiting after a destination point, so the point marked by the last begin_index value is labeled as a destination, the records between that point and this current and last record are marked 
                    as waiting, and then this last record is marked as waiting
        Case 3.b.ii: This record is the last record of the time period and its cluster value is not -1 and it is not equal to the previous cluster. Since it was the last record of the day, it is labeled as a 
                        destination, and all records previous to this record would have been handled by Case 4 or Case 2.a
        Case 4.a: This record has a non -1 cluster value and it is neither the first nor the last record. Also, it's cluster value is the same as the cluster values of the records just prior and just after
                    so this record is indicates the bike is stationary, so the counter variable that counts the number of stationary records is incremented
        Case 4.b: This record has a non -1 value which is different than the cluster values of the records just previous and just after it. The consolidation process should retain at least 2 records for each non-transit record
                    so the fact that there is only one here indicates GPS error. Thus, this record is just labeled as transit
        Case 4.c.i: This record has a non -1 value that is different than the cluster value from eithe the previous record or the next record but not both. This means that a stop_event is either beginning or ending. In this case,
                    the is_start_wait flag was set to True, so a stop event is beginning, so the corresponding variables are set storing index, etc. so that when the stop event ends, the algorithm will be able to refer to these variables
                    to know how far back to go to record the labels for the records in the stop event
        Case 4.c.ii.1: This record has a non -1 cluster value and it is different from the cluster values of either the record just previous or just after but it is not different from both. This means a stop event either began or ended.
                        In this case, based on the flag variable indicator is_start_wait = False, so the stop event is ending. Thus, the algorithm checks the time difference between this record and the record that was identified during
                        the beginning of the stop event and denoted by begin_index. This case handles what happens when that time difference is less than or equal to 15 minutes, making this a start_dwell/dwell/end_dwell event, unless this
                        the first stop event, in which case is marked as origin/waiting/destination, to make the first record label of the time period a destination rather than a start_dwell
        Case 4.c.ii.2: Same process as Case 4.d.ii.1 except the records of this stop event are labeled as destination/waiting/origin rather than start_dwell/dwell/end_dwell
        
    """
    
    
    if isinstance(input_data, pd.DataFrame):
        # DataFrame.
        raw_data = input_data
    else:
        # Assumes it is a csv file with field names lon and lat.
        raw_data = pd.read_csv(input_data)
        
    #['company', 'city', 'local_time', 'bike_id', 'is_reserved', 'is_disabled', 'lat', 'lon', 'type', 'id', 'last_updated', 'cluster'])
    bike_list = raw_data['bike_id'].unique()
    

#######################################################################################################
# Process to be performed on each individual bike id
#######################################################################################################
    trip_data = pd.DataFrame()
    
    for bike in bike_list:
        bike = ''.join(bike)
            
        print("get bike " + bike)
        
        df = raw_data.loc[raw_data['bike_id'] == bike]
        
#######################################################################################################
# Spatial density clustering performed here
#######################################################################################################
    
        df2 = df[['lat', 'lon']]
                  
        # clustering algorithm
        decimal_degree_conversion_factor = 0.000003
        maximum_distance = 100  # feet
        maximum_distance = maximum_distance * decimal_degree_conversion_factor
        clustering = DBSCAN(eps=maximum_distance, min_samples=2).fit(df2)
        clustering.labels_
    
        # Put results into the dataframe
        df["cluster"] = clustering.labels_
        
        df.sort_values(by=['local_time'], axis=0, ascending=True, inplace=True, kind='quicksort')
        
        # These store the trip_status labels and trip ids for each record, so the length of these lists equals the number of rows in df
        trip_status = []
        trip_id = []
     
        # Setup of initial variables used in tracking the number of stationary records  
        begin_index = 0
        num_waits = 0
        # fresh_index required since index values of df may not be incremental
        fresh_index = 0
        previous_cluster = current_cluster = next_cluster = 0
        
        # trip schema is bike_id_local_time, so first trip is created from first record of df
        trip = df.iloc[0]['bike_id'].strip() + "_" + str(df.iloc[0]['local_time'])
        
        # whether or not the bike is in transit at the beginning of the day affects whether the bike begins in a stop event or not
        if df.iloc[0]['cluster'] == -1:
            is_start_wait = True
        else:
            is_start_wait = False
          
#######################################################################################################
# Beginning of trip identification
#######################################################################################################
          
        #Case 1
        # df.index is the number of rows in the dataframe df
        if (len(df.index)) == 1:
            
            trip_status.append("origin")
            trip_id.append(trip)

            
        else:
            
            # for each row in df, a trip status label is appended to trip_status and a trip id is appended to trip_id.
            # these cannot happen at the end of each iteration, since sometimes multiple appends are required per iteration.
            # Thus, they are handled in their respective cases
            for index, row in df.iterrows():
                
                current_cluster = row['cluster']
                

                # Case 2.a     
                if current_cluster == -1 and fresh_index != 0 and fresh_index != len(df.index) - 1:
                    
                    trip_status.append("transit")
                        
                    trip_id.append(trip)
                     
                if fresh_index == 0: 
                    next_cluster = df.iloc[fresh_index + 1]['cluster'] 
                    # Case 2.b.i
                    if current_cluster == -1:     
                        trip_status.append("origin")
                        trip_id.append(trip) 
                    else: 
                        # Case 2.b.ii.1
                        if current_cluster != next_cluster:                      
                            trip_status.append("origin")
                            trip_id.append(trip)
                            is_start_wait = True
                            
                        # Case 2.b.ii.2 n/a
                
                if fresh_index == len(df.index) - 1:
                    
                    previous_cluster = df.iloc[fresh_index - 1]['cluster']
                    
                    # Case 3.a
                    if current_cluster == -1:
                        
                        trip_status.append("destination")
                        trip_id.append(trip)
                        
                    else:
                        
                        # Case 3.b.i, alternate append statements left in because they will be hard to figure out if needed again. All other cases just use append(label + str(fresh_index))
                        if current_cluster == previous_cluster:
                                           
                            #trip_status.append("destination " + str(fresh_index - num_waits - 1))
                            
                            trip_status.append("destination")
                            trip_id.append(trip)
                            
                            
                            for i in range(0,num_waits):
                                                    
                                #trip_status.append("waiting " + str(fresh_index - num_waits + i))
                                
                                trip_status.append("waiting")
                                trip_id.append("na")
                                
                            #trip_status.append("waiting " + str(fresh_index))
                            trip_status.append("waiting")
                            trip_id.append("na")
                               
                        # Case 3.b.ii
                        else:                 
                                
                            trip_status.append("destination")
                            trip_id.append(trip)
                            
                
                if current_cluster != -1 and fresh_index != 0 and fresh_index != len(df.index) - 1:
                            
                    previous_cluster = df.iloc[fresh_index - 1]['cluster']
                    next_cluster = df.iloc[fresh_index + 1]['cluster']     
        
                    # Case 4.a            
                    if current_cluster == previous_cluster and current_cluster == next_cluster:
                        
                        num_waits = num_waits + 1
                    
                    # Case 4.b
                    elif current_cluster != previous_cluster and current_cluster != next_cluster:
                        
                        trip_status.append("transit")
                        trip_id.append(trip)
                        
                    elif current_cluster != previous_cluster or current_cluster != next_cluster:
                        
                        # Case 4.c.i
                        if is_start_wait:
                            
                            num_waits = 0
                            begin_index = fresh_index
                            is_start_wait = False
                            
                        else:
                            
                            time_diff = int(df.iloc[fresh_index]['local_time']) - int(df.iloc[begin_index]['local_time'])
                            
                            # Case 4.c.ii.1
                            if time_diff <= 15:
                                
                                if begin_index == 0:                                    
                                    start_tag = "origin"
                                    wait_tag = "waiting"
                                    stop_tag = "destination"
                                    
                                else:                                    
                                    start_tag = "end_dwell"
                                    wait_tag = "dwell"
                                    stop_tag = "start_dwell"
                                                        
                                #trip_status.append(stop_tag + " " + str(fresh_index - num_waits - 1))
                                
                                trip_status.append(stop_tag)
                                trip_id.append(trip)
                                
                                for i in range(0, num_waits):                           
                                    
                                    #trip_status.append(wait_tag + " " + str(fresh_index - num_waits + i))
                                    trip_status.append(wait_tag)
                                    trip_id.append(trip)
                                
                                #trip_status.append(start_tag + " " + str(fresh_index))
                                trip_status.append(start_tag)
                                trip_id.append(trip)
                                
                                
                                is_start_wait = True
                                
                            # Case 4.c.ii.2    
                            else:                        
                                
                                #trip_status.append("destination " + str(fresh_index - num_waits - 1))
                                trip_status.append("destination")
                                trip_id.append(trip)
                                
                                
                                for i in range(0, num_waits):
                                                                
                                    #trip_status.append("waiting " + str(fresh_index - num_waits + i))
                                    trip_status.append("waiting")
                                    trip_id.append("na")
                                
                                #trip_status.append("origin " + str(fresh_index))
                                
                                trip_status.append("origin")
                                trip = row['bike_id'].strip() + "_" + str(row['local_time'])
                                trip_id.append(trip)                            
                                
                                is_start_wait = True
                            
                fresh_index = fresh_index + 1
        
        df['trip_status'] = trip_status
        df['trip_id'] = trip_id
            
        
        
        trip_data = trip_data.append(df)
        print(trip_data.columns)
        
    trip_data = trip_data[['company', 'city', 'local_time', 'bike_id', 'is_reserved', 
                               'is_disabled', 'lat', 'lon', 'vehicle_type', 'last_updated', 'cluster', 'trip_status', 'trip_id']]
        
    if csv_output:
        trip_data.to_csv(csv_output, index=False)

     
    return trip_data

def identify_ODs_from_trajectories(input_file, csv_output):
    
    trip_data = pd.read_csv(input_file)
    trip_data = trip_data.loc[ trip_data['trip_status'].isin(['destination', 'origin', 'start_dwell', 'end_dwell']) ]
    trip_data.to_csv(csv_output, index=False)
        
        
        
if __name__ == '__main__':
 
    # =============================================================================
    # Main
    # =============================================================================
    start_time = time.time()
     
    # =============================================================================
    # Paths and Parameters
    # =============================================================================
     
    if platform.system() == 'Windows':
        # Paths when running in GIS_Tools on Windows
     
        company = 'jump'
        city = 'sacramento'
        start_timestamp = '201906240300'  # timestamps need to be in format of YYYYMMDDhhmm
        end_timestamp = '201906250800'
        is_station = "_stations"   # if querying station status results, let is_station = "_stations". Else if querying free bike status results, let is_station = ""
        csv_output = 'removed for privacy'
        csv_input = 'removed for privacy'
        OD_csv_output = 'removed for privacy'

    else:
              
        # Paths when running in AWS EC2 instance
        # =============================================================================
        files_path = 'removed for privacy'
        fernet_bin = 'removed for privacy'
        credentials_bin = 'removed for privacy'
          
        company = sys.argv[1]
        city =sys.argv[2]
        start_timestamp = sys.argv[3]
        end_timestamp = sys.argv[4]
        is_station = ""
    
     
    # =============================================================================
    # Process
    # =============================================================================
     
    identify_trips_from_trajectories(csv_input, csv_output)
    identify_ODs_from_trajectories(csv_output, OD_csv_output)
     
     
    print("Finished")
    print(time.time() - start_time, "seconds", "\n")
