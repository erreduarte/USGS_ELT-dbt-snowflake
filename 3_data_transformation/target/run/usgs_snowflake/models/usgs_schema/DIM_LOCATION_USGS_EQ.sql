-- back compat for old kwarg name
  
  begin;
    

        insert into EARTHQUAKE_USGS.EARTHQUAKE_DATA.DIM_LOCATION_USGS_EQ ("ID", "REGISTERED_AT", "PLACE", "GEO_TYPE", "LATITUDE", "LONGITUDE", "ALTITUDE")
        (
            select "ID", "REGISTERED_AT", "PLACE", "GEO_TYPE", "LATITUDE", "LONGITUDE", "ALTITUDE"
            from EARTHQUAKE_USGS.EARTHQUAKE_DATA.DIM_LOCATION_USGS_EQ__dbt_tmp
        );
    commit;