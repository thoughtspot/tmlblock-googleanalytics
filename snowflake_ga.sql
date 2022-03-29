USE DATABASE GOOGLE_ANALYTICS;
CREATE OR REPLACE TABLE "GOOGLE_ANALYTICS"."PUBLIC"."RAW_TRAFFIC_SOURCE" (
  "SOURCE" VARIANT
) 
COMMENT = 'variant storage of google analytics for traffic source ';

CREATE OR REPLACE VIEW GA_TRAFFIC_SOURCE AS (
  select 
    VALUE:dimensions[0]::string as "ga:userType"
    --,VALUE:dimensions[1]::string as "ga:date"
    ,TO_DATE(VALUE:dimensions[1]::string,'YYYYMMDD') as "ga:date"
    ,VALUE:dimensions[2]::string as "ga:campaign"
    ,VALUE:dimensions[3]::string as "ga:source"
    ,VALUE:dimensions[4]::string as "ga:medium"
    ,VALUE:dimensions[5]::string as "ga:keyword"
    ,VALUE:dimensions[6]::string as "ga:adContent"
    ,VALUE:dimensions[7]::string as "ga:socialNetwork"
    ,VALUE:dimensions[8]::string as "ga:channelGrouping"
    
    ,VALUE:metrics[0]:values[0]::integer as "ga:sessions"
    ,VALUE:metrics[0]:values[1]::integer as "ga:users"
    ,VALUE:metrics[0]:values[2]::integer as "ga:bounces"
    ,VALUE:metrics[0]:values[3]::double as "ga:sessionDuration"
    ,VALUE:metrics[0]:values[4]::double as "ga:pageviews"
    ,VALUE:metrics[0]:values[5]::integer as "ga:organicSearches"
  from
    "GOOGLE_ANALYTICS"."PUBLIC"."RAW_TRAFFIC_SOURCE"
  ,lateral flatten( input => SOURCE:reports[0]:data:rows )
  )
  ;
  
CREATE OR REPLACE TABLE "GOOGLE_ANALYTICS"."PUBLIC"."RAW_GEO_AUDIENCE" (
  "SOURCE" VARIANT
) 
COMMENT = 'variant storage of google analytics for geo audience ';

CREATE OR REPLACE VIEW GA_GEO_AUDIENCE AS (
  select 
    TO_DATE(VALUE:dimensions[0]::string,'YYYYMMDD') as "ga:date"
    ,VALUE:dimensions[1]::string as "ga:country"
    ,VALUE:dimensions[2]::string as "ga:region"
    ,VALUE:dimensions[3]::double as "ga:latitude"
    ,VALUE:dimensions[4]::double as "ga:longitude"
    ,VALUE:dimensions[5]::string as "ga:channelGrouping"
    ,VALUE:dimensions[6]::string as "ga:userType"
    ,VALUE:dimensions[7]::string as "ga:source"
    ,VALUE:dimensions[8]::string as "ga:medium" 
    
    ,VALUE:metrics[0]:values[0]::integer as "ga:sessions"
    ,VALUE:metrics[0]:values[1]::integer as "ga:users"
    ,VALUE:metrics[0]:values[2]::integer as "ga:bounces"
    ,VALUE:metrics[0]:values[3]::double as "ga:sessionDuration"
    ,VALUE:metrics[0]:values[4]::double as "ga:pageviews"
  from
    "GOOGLE_ANALYTICS"."PUBLIC"."RAW_GEO_AUDIENCE"
  ,lateral flatten( input => SOURCE:reports[0]:data:rows )
  )
  ; 
  
CREATE OR REPLACE TABLE "GOOGLE_ANALYTICS"."PUBLIC"."RAW_DEMOGRAPHICS_AUDIENCE" (
  "SOURCE" VARIANT
) 
COMMENT = 'variant storage of google analytics for demographice audience ';

CREATE OR REPLACE VIEW GA_DEMOGRAPHIC_AUDIENCE AS (
  select 
    TO_DATE(VALUE:dimensions[0]::string,'YYYYMMDD') as "ga:date"
    ,VALUE:dimensions[1]::string as "ga:userAgeBracket"
    ,VALUE:dimensions[2]::string as "ga:userGender"
    ,VALUE:dimensions[3]::string as "ga:interestAffinityCategory"
    ,VALUE:dimensions[4]::string as "ga:channelGrouping"
    ,VALUE:dimensions[5]::string as "ga:userType"
    ,VALUE:dimensions[6]::string as "ga:source"
    ,VALUE:dimensions[7]::string as "ga:medium" 
    
    ,VALUE:metrics[0]:values[0]::integer as "ga:sessions"
    ,VALUE:metrics[0]:values[1]::integer as "ga:users"
    ,VALUE:metrics[0]:values[2]::integer as "ga:bounces"
    ,VALUE:metrics[0]:values[3]::double as "ga:sessionDuration"
    ,VALUE:metrics[0]:values[4]::double as "ga:pageviews"
  from
    "GOOGLE_ANALYTICS"."PUBLIC"."RAW_DEMOGRAPHICS_AUDIENCE"
  ,lateral flatten( input => SOURCE:reports[0]:data:rows )
  )
  ; 

CREATE OR REPLACE TABLE "GOOGLE_ANALYTICS"."PUBLIC"."RAW_PAGE_BEHAVIOUR" (
  "SOURCE" VARIANT
) 
COMMENT = 'variant storage of google analytics for page behaviour ';

CREATE OR REPLACE VIEW GA_PAGE_BEHAVIOUR AS (
  select 
    TO_DATE(VALUE:dimensions[0]::string,'YYYYMMDD') as "ga:date"
    ,VALUE:dimensions[1]::string as "ga:hostname"
    ,VALUE:dimensions[2]::string as "ga:pagePath"
    ,VALUE:dimensions[3]::string as "ga:landingPagePath"
    ,VALUE:dimensions[4]::string as "ga:secondPagePath"
    ,VALUE:dimensions[5]::string as "ga:exitPagePath"
    ,VALUE:dimensions[6]::string as "ga:pageTitle"
    ,VALUE:dimensions[7]::string as "ga:source"
    ,VALUE:dimensions[8]::string as "ga:country"
    
    ,VALUE:metrics[0]:values[0]::integer as "ga:sessions"
    ,VALUE:metrics[0]:values[1]::integer as "ga:entrances"
    ,VALUE:metrics[0]:values[2]::integer as "ga:pageviews"
    ,VALUE:metrics[0]:values[3]::double as "ga:timeOnPage"
    ,VALUE:metrics[0]:values[4]::double as "ga:exits"
    ,VALUE:metrics[0]:values[5]::double as "ga:pageValue"
  from
    "GOOGLE_ANALYTICS"."PUBLIC"."RAW_PAGE_BEHAVIOUR"
  ,lateral flatten( input => SOURCE:reports[0]:data:rows )
  )
  ; 
    
CREATE OR REPLACE TABLE "GOOGLE_ANALYTICS"."PUBLIC"."RAW_SITE_STATISTICS" (
  "SOURCE" VARIANT
) 
COMMENT = 'variant storage of google analytics for site technical statistics ';

CREATE OR REPLACE VIEW GA_SITE_STATISTICS AS (
  select 
    TO_DATE(left(VALUE:dimensions[0],8)::string,'YYYYMMDD') as "ga:date"
    ,TO_TIME(right(VALUE:dimensions[0]::string,4)::string,'HH24MI') as "ga:time"
    ,VALUE:dimensions[1]::string as "ga:hostname"
    ,VALUE:dimensions[2]::string as "ga:pagePath"
    ,VALUE:dimensions[3]::string as "ga:country"
    ,VALUE:dimensions[4]::string as "ga:browser"
    ,VALUE:dimensions[5]::string as "ga:operatingSystemVersion"
    ,VALUE:dimensions[6]::string as "ga:deviceCategory"
    ,VALUE:dimensions[7]::string as "ga:operatingSystem"
    ,VALUE:dimensions[8]::string as "ga:language"
    
    ,VALUE:metrics[0]:values[0]::integer as "ga:sessions"
    ,VALUE:metrics[0]:values[1]::integer as "ga:pageviews"
    ,VALUE:metrics[0]:values[2]::integer as "ga:avgPageLoadTime"
    ,VALUE:metrics[0]:values[3]::double as "ga:avgPageDownloadTime"
    ,VALUE:metrics[0]:values[4]::double as "ga:avgRedirectionTime"
    ,VALUE:metrics[0]:values[5]::double as "ga:avgServerConnectionTime"
    ,VALUE:metrics[0]:values[6]::double as "ga:serverResponseTime"
  from
    "GOOGLE_ANALYTICS"."PUBLIC"."RAW_SITE_STATISTICS"
  ,lateral flatten( input => SOURCE:reports[0]:data:rows )
  )
  ; 

CREATE OR REPLACE TABLE "GOOGLE_ANALYTICS"."PUBLIC"."RAW_AD_ANALYTICS" (
  "SOURCE" VARIANT
) 
COMMENT = 'variant storage of google analytics for adword analytics ';

CREATE OR REPLACE VIEW GA_AD_ANALYTICS AS (
  select 
    TO_DATE(left(VALUE:dimensions[0],8)::string,'YYYYMMDD') as "ga:date"
    ,VALUE:dimensions[1]::string as "ga:adGroup"
    ,VALUE:dimensions[2]::string as "ga:adContent"
    ,VALUE:dimensions[3]::string as "ga:adDistributionNetwork"
    ,VALUE:dimensions[4]::string as "ga:campaign"
    ,VALUE:dimensions[5]::string as "ga:adSlot"
    
    ,VALUE:metrics[0]:values[0]::integer as "ga:impressions"
    ,VALUE:metrics[0]:values[1]::integer as "ga:adClicks"
    ,VALUE:metrics[0]:values[2]::integer as "ga:adCost"
    ,VALUE:metrics[0]:values[3]::double as "ga:CPM"
    ,VALUE:metrics[0]:values[4]::double as "ga:CPC"
    ,VALUE:metrics[0]:values[5]::double as "ga:transactionRevenue"
    ,VALUE:metrics[0]:values[6]::double as "ga:sessions"
    ,VALUE:metrics[0]:values[7]::double as "ga:bounces"
    ,VALUE:metrics[0]:values[8]::double as "ga:users"
   ,VALUE:metrics[0]:values[9]::double as "ga:pageviews"
  from
    "GOOGLE_ANALYTICS"."PUBLIC"."RAW_AD_ANALYTICS"
  ,lateral flatten( input => SOURCE:reports[0]:data:rows )
  )
  ; 