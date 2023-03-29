{{ config(materialized='table') }}

select
Physician_Primary_Type
,EXTRACT(YEAR FROM Date_of_Payment) AS year
,sum(Total_Amount_of_Payment_USDollars) as total_funding
from
{{ref('data_cleaning')}}
group by 1,2 