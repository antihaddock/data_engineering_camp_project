
{{ config(materialized='table') }}

select
Teaching_Hospital_Name
,EXTRACT(MONTH FROM Date_of_Payment) AS month
,sum(Total_Amount_of_Payment_USDollars) as total_funding
from
{{ref('data_cleaning')}}
where Teaching_Hospital_Name is not null
group by 1,2 