-- back compat for old kwarg name
  
  begin;
    

        insert into EARTHQUAKE_USGS.EARTHQUAKE_DATA.DIM_PROPERTIES_USGS_EQ ("ID", "REGISTERED_AT", "TYPE", "TITLE", "URL", "DETAIL", "NET", "SOURCES", "TYPES", "MAGTYPE")
        (
            select "ID", "REGISTERED_AT", "TYPE", "TITLE", "URL", "DETAIL", "NET", "SOURCES", "TYPES", "MAGTYPE"
            from EARTHQUAKE_USGS.EARTHQUAKE_DATA.DIM_PROPERTIES_USGS_EQ__dbt_tmp
        );
    commit;