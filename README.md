Readme file for the data engineering camp!

# DataTalks.Club Data Engineering Camp Project


## Problem Description


**The dataset**

TBC


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
4. GCP in the form of google bucket and BigQuery


## What tool does what

**1.** Terraform is used to create the cloud infastructure to be utilised for this project. All terraform files are stored in the terraform directory. ``GCP_infastructure.tf`` is used to create a google bucket for ingesting raw data into and to create two BigQuery datasets, ``healthcare_payments_raw`` and ``healthcare_payments_transformed``. All terraform files for infastructure creation are stored in the ``terraform`` directory

**2.** Prefect is used for workflow orchestration to facilitate data ingestion into our google bucket of the raw csv file and to transfer this csv file into BigQuery in the  ``healthcare_payments_raw`` dataset.  Prefect performs the extract and load components of the ELT pipeline. All files for the extract and load stages are stored in the ``Prefect`` directory.

**3** dbt is used as our transform tool in the ELT pipeline. dbt is used to take data from  ``healthcare_payments_raw`` and clean/transform this data in  ``healthcare_payments_transformed``. All files used for dbt are stored in the ``dbt`` directory


## BigQuery Data Warehouse optimisation and layout
I am  apply the a multi layer data warehouse architecture, this would normally take the form of a 3 layer architecture (``raw``, ``transformed``, ``reporting``)
but for the purpose of this task a 3rd layer is superfluous.

We apply optimisation in the form of partitioning and clustering in  healthcare_payments_transformed. This is done inside dbt config file ``dbt_project.yml``