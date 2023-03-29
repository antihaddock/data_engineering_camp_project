
{{ config(materialized='table') }}

select
Teaching_Hospital_Name
,EXTRACT(YEAR FROM Date_of_Payment) AS month
,sum(Total_Amount_of_Payment_USDollars) as total_funding
from
{{ref('data_cleaning')}}
group by 1,2 