# Google Analytics Starter Kit
Create a set of ThoughtSpot visualizations based on Google Analytics data hosted in Snowflake

# Worksheets included
- AdWords Analysis 
- Demographic Audience Analysis
- Geographic Audience Analysis
- Page Behaviour Analysis
- Site Statistics Analysis
- Traffic Source Analysis - Google Analytics

# Liveboards included

## Acquisition
 - Adwords
 - Traffic Sources

## Audience
- Geographic Location

## Behavior
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







