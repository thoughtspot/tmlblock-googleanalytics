#Google Analytics Starter Kit
Create a set of ThoughtSpot visualizations based on Google Analytics data hosted in Snowflake

# Installation instructions
- Use the HelloAnalytics.py Python Script to download your Google Analytics data to either your local machine or a staging machine.
- Use the snowflake_ga.sql DDL script to create the necessary staging tables and flattening views in your Snowflake data warehouse.
- Load your JSON data files into their respective Snowflake tables using your preferred loading method.
- Log into your ThoughtSpot instance and create an Embrace connection to each of the five views that have flattened the JSON data into a relational table structure.
- Import the TML for the worksheets and verify that it has all been imported without any errors.
- Import the TML for the liveboards and verify that it has all been imported without any errors.

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





