select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select LATITUDE
from EARTHQUAKE_USGS.EARTHQUAKE_DATA.DIM_LOCATION_USGS_EQ
where LATITUDE is null



      
    ) dbt_internal_test