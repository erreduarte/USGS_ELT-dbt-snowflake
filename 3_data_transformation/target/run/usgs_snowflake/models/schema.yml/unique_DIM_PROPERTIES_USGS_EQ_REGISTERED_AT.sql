select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    REGISTERED_AT as unique_field,
    count(*) as n_records

from EARTHQUAKE_USGS.EARTHQUAKE_DATA.DIM_PROPERTIES_USGS_EQ
where REGISTERED_AT is not null
group by REGISTERED_AT
having count(*) > 1



      
    ) dbt_internal_test