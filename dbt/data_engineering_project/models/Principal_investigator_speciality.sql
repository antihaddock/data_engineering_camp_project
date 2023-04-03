{{ config(materialized='table',
cluster_by="Physician_Primary_Type") }}

select
Physician_Primary_Type
,EXTRACT(MONTH FROM Date_of_Payment) AS month
,sum(Total_Amount_of_Payment_USDollars) as total_funding
from
{{ref('data_cleaning')}}
where Physician_Primary_Type is not null
group by 1,2 