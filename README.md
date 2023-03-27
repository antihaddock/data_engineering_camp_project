Readme file for the data engineering camp!

# DataTalks.Club Data Engineering Camp Project


## Problem Description


**The dataset**


This project uses the MIMIC III dataset which is a de identified real life dataset from an intensive care unit, measuring patient vital signs, tests and administrative data. The dataset can be found here: https://registry.opendata.aws/mimiciii/ 

From the MIMIC-III documentation

*MIMIC-III (Medical Information Mart for Intensive Care III) is a large, freely-available database comprising deidentified health-related data associated with over forty thousand patients who stayed in critical care units of the Beth Israel Deaconess Medical Center between 2001 and 2012.*

*The database includes information such as demographics, vital sign measurements made at the bedside (~1 data point per hour), laboratory test results, procedures, medications, caregiver notes, imaging reports, and mortality (both in and out of hospital).*


## The Project

This project aims to:
1. Take this dataset and upload into a GCS bucket
2. Load the dataset from GCS bucket into BigQuery
3. Transform this data and clean the data into a transformed data  layer in BigQuery.
4. Visualise this data in Google Data Studio

Tools used to do this are:
1. Terraform
2. Prefect
3. dbt

