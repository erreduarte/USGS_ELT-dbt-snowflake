-- back compat for old kwarg name
  
  begin;
    

        insert into EARTHQUAKE_USGS.STG_EARTHQUAKE_DATA.STG_EARTHQUAKE_HISTORY ("MAGNITUDE", "PLACE", "REGISTERED_AT", "UPDATED_AT", "TZ", "URL", "DETAIL", "FELT", "CDI", "MMI", "ALERT", "STATUS", "TSUNAMI", "SIG", "NET", "ID", "IDS", "SOURCES", "TYPES", "NST", "DMIN", "RMS", "GAP", "MAGTYPE", "TYPE", "TITLE", "GEO_TYPE", "LATITUDE", "LONGITUDE", "ALTITUDE", "RN")
        (
            select "MAGNITUDE", "PLACE", "REGISTERED_AT", "UPDATED_AT", "TZ", "URL", "DETAIL", "FELT", "CDI", "MMI", "ALERT", "STATUS", "TSUNAMI", "SIG", "NET", "ID", "IDS", "SOURCES", "TYPES", "NST", "DMIN", "RMS", "GAP", "MAGTYPE", "TYPE", "TITLE", "GEO_TYPE", "LATITUDE", "LONGITUDE", "ALTITUDE", "RN"
            from EARTHQUAKE_USGS.STG_EARTHQUAKE_DATA.STG_EARTHQUAKE_HISTORY__dbt_tmp
        );
    commit;