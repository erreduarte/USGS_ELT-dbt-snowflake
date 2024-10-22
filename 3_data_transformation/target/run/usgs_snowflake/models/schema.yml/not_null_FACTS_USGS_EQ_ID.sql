select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select ID
from EARTHQUAKE_USGS.EARTHQUAKE_DATA.FACTS_USGS_EQ
where ID is null



      
    ) dbt_internal_test