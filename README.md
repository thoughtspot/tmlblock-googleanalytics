# Google Analytics TML Blocks
Create a set of ThoughtSpot visualizations based on Google Analytics data hosted in Snowflake. Analyze user acquisition and user behavior of your website with search, drill-downs, and spotIQ. 

# Artifacts 

## Python Script 
Python Script (HelloAnalytics.py) to download data via the Google Analytics API.

## Snowflake DDL
Snowflake DDL (snowflake_ga.sql)  for creating tables and views that flatten the Google Analytics JSON data.

## Worksheets 
- AdWords Analysis 
- Demographic Audience Analysis
- Geographic Audience Analysis
- Page Behaviour Analysis
- Site Statistics Analysis
- Traffic Source Analysis

## Liveboards included
### Acquisition
 - Adwords
 - Traffic Sources
### Audience
- Geographic Location
### Behavior
- Page Analytics
- Site Statistics

# Installation instructions

## Local environment configuration
This starter kit uses the Google [analytics reporting API v4](https://developers.google.com/analytics/devguides/reporting/core/v4/quickstart/installed-py?authuser=2). Hello Analytics Reporting API V4. To get started, execute the following commands on your local environment. 

### setup virtual environment
`sudo -s apt-get install python3-venv python3 -m venv analytics-quickstart`

### Activate virtual environment:
`source analytics-quickstart/bin/activate`

### install google api packages
`pip install --upgrade google-api-python-client pip install --upgrade oauth2client`

## Retrieve and prep your data

- Use the HelloAnalytics.py Python Script to download your Google Analytics data to either your local machine or a staging machine.
- Use the snowflake_ga.sql DDL script to create the necessary staging tables and flattening views in your Snowflake data warehouse.
- Load your JSON data files into their respective Snowflake tables using your preferred loading method.

## Connect ThoughtSpot and import TML
- Log into your ThoughtSpot instance and create an Embrace connection to each of the five views that have flattened the JSON data into a relational table structure.
- Import the TML for the worksheets and verify that it has all been imported without any errors.
- Import the TML for the liveboards and verify that it has all been imported without any errors.


# Liveboard Screenshots

### Adwords 
<img width="1500" alt="Screen Shot 2022-03-30 at 9 27 11 AM" src="https://user-images.githubusercontent.com/102629468/160886071-f56075bd-11c3-4bf1-9f3c-4ba75fce58d7.png">

### Traffic Sources 
<img width="1500" alt="Screen Shot 2022-03-30 at 9 36 55 AM" src="https://user-images.githubusercontent.com/102629468/160886548-60bcd1a2-fdb1-416c-844c-619c6c72f8f6.png">

### Geographic Location
<img width="1500" alt="Screen Shot 2022-03-30 at 9 29 42 AM" src="https://user-images.githubusercontent.com/102629468/160886633-9c871e8b-2688-4f8c-bc6f-c6780e69e24e.png">

### Page Analytics 
<img width="1500" alt="Screen Shot 2022-03-30 at 9 30 04 AM" src="https://user-images.githubusercontent.com/102629468/160886791-e140667c-1f4a-45d4-b28b-47c8bd128857.png">

### Site Statistics 
<img width="1500" alt="Screen Shot 2022-03-30 at 9 30 23 AM" src="https://user-images.githubusercontent.com/102629468/160886910-3e49b232-1028-4c0f-ab90-93b800a54f8d.png">






