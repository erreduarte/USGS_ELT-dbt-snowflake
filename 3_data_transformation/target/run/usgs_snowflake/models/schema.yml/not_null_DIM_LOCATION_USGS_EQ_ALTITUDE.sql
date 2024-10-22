select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select ALTITUDE
from EARTHQUAKE_USGS.EARTHQUAKE_DATA.DIM_LOCATION_USGS_EQ
where ALTITUDE is null



      
    ) dbt_internal_test