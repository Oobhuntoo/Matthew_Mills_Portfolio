# Bicycle Traffic Research

The goal of this project (which is currently ongoing) is to scrape realtime transit data from dockless bikeshare companies such as Jump and Lime
once a minute for an entire year in order to construct a historical dataset and run regression analysis and perform seasonal adjustment on the models.
The project consists of two main tasks: 1.) scraping data each minute and 2.) removing redundant records each day. The datasource is the data provided 
by the GBFS (more information given in the file "GBFS_Summary.pdf" in this folder). The data is scraped into an AWS RDS postgres database using the function
called "scrape" in the file "bikedata_tasks.py" in this folder. Then, once a day, a cron job will initiate the daily cleaning/aggregation process that will
remove redundant records. More information is provided in the comments of the code and in the document called "Proposal.pdf", which was an older technical
proposal I wrote for this system.

I wrote both of the python files in this folder from scratch. The second file called "get_trips.py" contains an algorithm I created that mines GPS coordinates
in order to check for start/stop events. The data is delivered in the form of lat/lon/timestamp tuples for given bike id's that occur at least one minute apart for each bike.
Geospatial clustering is performed using sci-kit learn's DBSCAN algorithm on the records for each bike, and then the records are sorted in ascending order according to their timestamp.
If the first and last data points in the cluster differ by < 15 minutes, the cluster is marked as a dwell event, and if they are > 15 minutes apart, the cluster is marked as a stop event.

The system used to be deployed on a webpage at the following link, until it broke due to dependency issues with the university's hosting server:

https://www.insideidaho.org/geoportal/apps/webappviewer/index.html?id=5a5e26f15d52445fb8c8b00946aee7d6



