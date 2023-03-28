
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (

    select 
    change_type,
    count(change_type) as total 
    from
    healthcare_payments_raw.ingest
    group by change_type
    limit 100
)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null