"""
Hello Analytics Reporting API V4.
https://developers.google.com/analytics/devguides/reporting/core/v4/quickstart/installed-py?authuser=2

setup virtual environment
sudo -s apt-get install python3-venv python3 -m venv analytics-quickstart

Activate virtual environment:
source analytics-quickstart/bin/activate

install google api packages
pip install --upgrade google-api-python-client pip install --upgrade oauth2client


"""

import argparse
import json #damian edit

from apiclient.discovery import build
import httplib2
from oauth2client import client
from oauth2client import file
from oauth2client import tools

SCOPES = ['https://www.googleapis.com/auth/analytics.readonly']
CLIENT_SECRETS_PATH = 'client_secrets.json' # Path to client_secrets.json file.
VIEW_ID = '37288529'


def initialize_analyticsreporting():
  """Initializes the analyticsreporting service object.

  Returns:
    analytics an authorized analyticsreporting service object.
  """
  # Parse command-line arguments.
  parser = argparse.ArgumentParser(
      formatter_class=argparse.RawDescriptionHelpFormatter,
      parents=[tools.argparser])
  flags = parser.parse_args([])

  # Set up a Flow object to be used if we need to authenticate.
  flow = client.flow_from_clientsecrets(
      CLIENT_SECRETS_PATH, scope=SCOPES,
      message=tools.message_if_missing(CLIENT_SECRETS_PATH))

  # Prepare credentials, and authorize HTTP object with them.
  # If the credentials don't exist or are invalid run through the native client
  # flow. The Storage object will ensure that if successful the good
  # credentials will get written back to a file.
  storage = file.Storage('analyticsreporting.dat')
  credentials = storage.get()
  if credentials is None or credentials.invalid:
    credentials = tools.run_flow(flow, storage, flags)
  http = credentials.authorize(http=httplib2.Http())

  # Build the service object.
  analytics = build('analyticsreporting', 'v4', http=http)

  return analytics

def get_report_traffic_source(analytics):
  # Use the Analytics Service Object to query the Analytics Reporting API V4.
  return analytics.reports().batchGet(
      #User Session Traffic Source Analysis
      #https://ga-dev-tools.web.app/dimensions-metrics-explorer/traffic-sources#Traffic-Sources
      body={
        'reportRequests': [
        {
          'viewId': VIEW_ID,
          'dateRanges': [{'startDate': '365daysAgo', 'endDate': 'today'}],
          'metrics': [
            {'expression': 'ga:sessions'},
            {'expression': 'ga:users'},
            {'expression':'ga:bounces'},
            {'expression': 'ga:sessionDuration'},
            {'expression': 'ga:pageviews'},
            {'expression': 'ga:organicSearches'},
            ],
          'dimensions': [
            {'name': 'ga:userType'},
            {'name': 'ga:date'},
            {'name': 'ga:campaign'},
            {'name': 'ga:source'},
            {'name': 'ga:medium'},
            {'name': 'ga:keyword'},
            {'name': 'ga:adContent'},
            {'name': 'ga:socialNetwork'},
            {'name': 'ga:channelGrouping'},
            ],
          "pageToken": "0",
          "pageSize": "10000",
        }]
      }
  ).execute()

def get_report_geo(analytics):
  # Use the Analytics Service Object to query the Analytics Reporting API V4.
  return analytics.reports().batchGet(
      body={
        'reportRequests': [
        {
          'viewId': VIEW_ID,
          'dateRanges': [{'startDate': '365daysAgo', 'endDate': 'today'}],
          'metrics': [
            {'expression': 'ga:sessions'},
            {'expression': 'ga:users'},
            {'expression':'ga:bounces'},
            {'expression': 'ga:sessionDuration'},
            {'expression': 'ga:pageviews'},
            ],
          'dimensions': [
            {'name': 'ga:date'},
            {'name': 'ga:country'},
            {'name': 'ga:region'},
            {'name': 'ga:latitude'},
            {'name': 'ga:longitude'},  
            {'name': 'ga:channelGrouping'},
            {'name': 'ga:userType'},
            {'name': 'ga:source'},
            {'name': 'ga:medium'},
                      
            ],
          "pageToken": "0",
          "pageSize": "100000",
        }]
      }
  ).execute()

def get_report_audience(analytics):
  # Use the Analytics Service Object to query the Analytics Reporting API V4.
  # cannot combine ga:interestInMarketCategory, ga:interestAffinityCategory, ga:interestOtherCategory in same 
  # query
  return analytics.reports().batchGet(
      body={
        'reportRequests': [
        {
          'viewId': VIEW_ID,
          'dateRanges': [{'startDate': '365daysAgo', 'endDate': 'today'}],
          'metrics': [
            {'expression': 'ga:sessions'},
            {'expression': 'ga:users'},
            {'expression':'ga:bounces'},
            {'expression': 'ga:sessionDuration'},
            {'expression': 'ga:pageviews'},
            ],
          'dimensions': [
            {'name': 'ga:date'},
            {'name': 'ga:userAgeBracket'},
            {'name': 'ga:userGender'},
            {'name': 'ga:interestAffinityCategory'},
            ],
          "pageToken": "0",
          "pageSize": "100000",
        }]
      }
  ).execute()

def get_report_page_tracking(analytics):
  # Use the Analytics Service Object to query the Analytics Reporting API V4.
  return analytics.reports().batchGet(
      body={
        'reportRequests': [
        {
          'viewId': VIEW_ID,
          'dateRanges': [{'startDate': '365daysAgo', 'endDate': 'today'}],
          'metrics': [
            {'expression': 'ga:sessions'},
            {'expression': 'ga:entrances'},
            {'expression':'ga:pageviews'},
            {'expression': 'ga:timeOnPage'},
            {'expression': 'ga:exits'},
            {'expression': 'ga:pageValue'}
            ],
          'dimensions': [
            {'name': 'ga:date'},
            {'name': 'ga:hostname'},
            {'name': 'ga:pagePath'},
            {'name': 'ga:landingPagePath'},
            {'name': 'ga:secondPagePath'},
            {'name': 'ga:exitPagePath'},
            {'name': 'ga:pageTitle'},
            {'name': 'ga:source'},
            {'name': 'ga:country'},
            ],
          "pageToken": "0",
          "pageSize": "10000",
        }]
      }
  ).execute()

def get_report_site_statistics(analytics):
  # Use the Analytics Service Object to query the Analytics Reporting API V4.
  return analytics.reports().batchGet(
      body={
        'reportRequests': [
        {
          'viewId': VIEW_ID,
          'dateRanges': [{'startDate': '365daysAgo', 'endDate': 'today'}],
          'metrics': [
            {'expression': 'ga:sessions'},
            {'expression':'ga:pageviews'},
            {'expression': 'ga:avgPageLoadTime'},
            {'expression': 'ga:avgPageDownloadTime'},
            {'expression': 'ga:avgRedirectionTime'},
            {'expression': 'ga:avgServerConnectionTime'},
            {'expression': 'ga:serverResponseTime'}
            ],
          'dimensions': [
            {'name': 'ga:dateHourMinute'},
            {'name': 'ga:hostname'},
            {'name': 'ga:pagePath'},
            {'name': 'ga:country'},
            {'name': 'ga:browser'},
            {'name': 'ga:operatingSystemVersion'},
            {'name': 'ga:deviceCategory'},
            {'name': 'ga:operatingSystem'},
            {'name': 'ga:language'},
            ],
          "pageToken": "0",
          "pageSize": "10000",
        }]
      }
  ).execute()

def get_report_adwords(analytics):
  # Use the Analytics Service Object to query the Analytics Reporting API V4.
  return analytics.reports().batchGet(
      body={
        'reportRequests': [
        {
          'viewId': VIEW_ID,
          'dateRanges': [{'startDate': '365daysAgo', 'endDate': 'today'}],
          'metrics': [
            {'expression': 'ga:impressions'},
            {'expression': 'ga:adClicks'},
            {'expression': 'ga:adCost'},
            {'expression': 'ga:CPM'},
            {'expression': 'ga:CPC'},
            {'expression': 'ga:transactionRevenue'},
            {'expression': 'ga:sessions'},
            {'expression': 'ga:bounces'},
            {'expression': 'ga:users'},
            {'expression': 'ga:pageviews'},
            ],
          'dimensions': [
            {'name': 'ga:date'},
            {'name': 'ga:adGroup'},
            {'name': 'ga:adContent'},
            {'name': 'ga:adDistributionNetwork'},
            {'name': 'ga:campaign'},
            {'name': 'ga:adSlot'},
            ],
          "pageToken": "0",
          "pageSize": "50000",
        }]
      }
  ).execute()

def print_response(response):
  """Parses and prints the Analytics Reporting API V4 response"""

  for report in response.get('reports', []):
    columnHeader = report.get('columnHeader', {})
    dimensionHeaders = columnHeader.get('dimensions', [])
    metricHeaders = columnHeader.get('metricHeader', {}).get('metricHeaderEntries', [])
    rows = report.get('data', {}).get('rows', [])

    for row in rows:
      dimensions = row.get('dimensions', [])
      dateRangeValues = row.get('metrics', [])

      for header, dimension in zip(dimensionHeaders, dimensions):
        print (header + ': ' + dimension)

      for i, values in enumerate(dateRangeValues):
        print ('Date range (' + str(i) + ')')
        for metricHeader, value in zip(metricHeaders, values.get('values')):
          print (metricHeader.get('name') + ': ' + value)

#damian edti
def print_file(response,prefix):
  fPath = './data/' + prefix + 'response.json'
  
  with open(fPath, 'w') as outfile:
    json.dump(response,outfile) 
    outfile.close() 
    print("file create:")
    print(outfile) 

def main():

  analytics = initialize_analyticsreporting()
  """
  response = get_report_traffic_source(analytics)
  print_file(response,'trafficsource_')

  response = get_report_geo(analytics)
  print_file(response,'geo_')

  response = get_report_audience(analytics)
  print_file(response,'audience_')

  response = get_report_page_tracking(analytics)
  print_file(response,'page_')

  response = get_report_site_statistics(analytics)
  print_file(response,'sitestats_150000_200000_')
  """
  
  response = get_report_adwords(analytics)
  print_file(response,'adwords_')
  


  #print_response(response)
  #print_file(response)

if __name__ == '__main__':
  main()
