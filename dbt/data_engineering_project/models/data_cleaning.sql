
{{ config(materialized='table',
          cluster_by = "Teaching_Hospital_Name",
          partition_by={
            "field": "Date_of_Payment",
            "data_type": "DATETIME_TRUNC",
            "granularity": "day"
       }
) }}

select
    Change_Type
    ,Covered_Recipient_Type
    ,Noncovered_Recipient_Entity_Name
    ,Teaching_Hospital_CCN
    ,Teaching_Hospital_ID
    ,Teaching_Hospital_Name
    ,Physician_Profile_ID
    ,Physician_First_Name
    ,Physician_Middle_Name
    ,Physician_Last_Name
    ,Physician_Name_Suffix
    ,Recipient_Primary_Business_Street_Address_Line1
    ,Recipient_Primary_Business_Street_Address_Line2
    ,Recipient_City
    ,Recipient_State
    ,Recipient_Zip_Code
    ,Recipient_Country
    ,Recipient_Province
    ,Recipient_Postal_Code
    ,Physician_Primary_Type
    ,Physician_Specialty
    ,Physician_License_State_code1
    ,Physician_License_State_code2
    ,Physician_License_State_code3
    ,Physician_License_State_code4
    ,Physician_License_State_code5
    ,Principal_Investigator_1_Profile_ID
    ,Principal_Investigator_1_First_Name
    ,Principal_Investigator_1_Middle_Name
    ,Principal_Investigator_1_Last_Name
    ,Principal_Investigator_1_Name_Suffix
    ,Principal_Investigator_1_Business_Street_Address_Line1
    ,Principal_Investigator_1_Business_Street_Address_Line2
    ,Principal_Investigator_1_City
    ,Principal_Investigator_1_State
    ,Principal_Investigator_1_Zip_Code
    ,Principal_Investigator_1_Country
    ,Principal_Investigator_1_Province
    ,Principal_Investigator_1_Postal_Code
    ,Principal_Investigator_1_Primary_Type
    ,Principal_Investigator_1_Specialty
    ,Total_Amount_of_Payment_USDollars
    ,CAST(Date_of_Payment AS DATE FORMAT 'MM/DD/YYYY') as date_of_payment
    ,Form_of_Payment_or_Transfer_of_Value
from
    {{source('raw','ingest')}}
where
-- drop rows where we don't have an etity name for the research
-- there last name or their first name
-- or the monetary value is missing
Noncovered_Recipient_Entity_Name is not null
or Principal_Investigator_1_Last_Name is not null
or Principal_Investigator_1_first_Name is not null
or Total_Amount_of_Payment_USDollars is not null 