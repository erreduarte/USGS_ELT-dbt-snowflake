-- back compat for old kwarg name
  
  begin;
    

        insert into EARTHQUAKE_USGS.EARTHQUAKE_DATA.DIM_STATUS_USGS_EQ ("ID", "REGISTERED_AT", "ALERT", "STATUS", "FELT", "CDI", "MMI")
        (
            select "ID", "REGISTERED_AT", "ALERT", "STATUS", "FELT", "CDI", "MMI"
            from EARTHQUAKE_USGS.EARTHQUAKE_DATA.DIM_STATUS_USGS_EQ__dbt_tmp
        );
    commit;