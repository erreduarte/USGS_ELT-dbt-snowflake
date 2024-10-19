-- back compat for old kwarg name
  
  begin;
    

        insert into EARTHQUAKE_USGS.EARTHQUAKE_DATA.FACTS_USGS_EQ ("ID", "REGISTERED_AT", "MAGNITUDE", "TSUNAMI", "SIG", "NST", "DMIN", "RMS", "GAP")
        (
            select "ID", "REGISTERED_AT", "MAGNITUDE", "TSUNAMI", "SIG", "NST", "DMIN", "RMS", "GAP"
            from EARTHQUAKE_USGS.EARTHQUAKE_DATA.FACTS_USGS_EQ__dbt_tmp
        );
    commit;