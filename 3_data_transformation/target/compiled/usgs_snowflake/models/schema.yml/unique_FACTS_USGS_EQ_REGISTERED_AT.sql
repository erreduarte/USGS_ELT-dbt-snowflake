
    
    

select
    REGISTERED_AT as unique_field,
    count(*) as n_records

from EARTHQUAKE_USGS.EARTHQUAKE_DATA.FACTS_USGS_EQ
where REGISTERED_AT is not null
group by REGISTERED_AT
having count(*) > 1


