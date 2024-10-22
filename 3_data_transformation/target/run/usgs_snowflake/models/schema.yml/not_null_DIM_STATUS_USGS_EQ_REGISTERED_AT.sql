select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select REGISTERED_AT
from EARTHQUAKE_USGS.EARTHQUAKE_DATA.DIM_STATUS_USGS_EQ
where REGISTERED_AT is null



      
    ) dbt_internal_test