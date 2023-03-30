Readme file for the data engineering camp!

# DataTalks.Club Data Engineering Camp Project


## Problem Description


**The dataset**
This project utilises the research payments data subset of the CMS Open Payments Dataset 2013 from Kaggle. https://www.kaggle.com/datasets/cms/cms-open-payments-dataset-2013 . From kaggle this dataset is described as:

***"Open Payments is a national disclosure program created by the Affordable Care Act (ACA) and managed by Centers for Medicare & Medicaid Services (CMS). The purpose of the program is to promote transparency into the financial relationships between pharmaceutical and medical device industries, and physicians and teaching hospitals. The financial relationships may include consulting fees, research grants, travel reimbursements, and payments from industry to medical practitioners. "***

I have used the research subset as this is a large dataset both in terms of the numbers of rows and columns and should require use of multiple tools explored during this course.

**Aim of the problem**

I will aim to answer the two following questions from this dataset:
1. Which teaching hospitals recieve the most funding
2. Which specialities recieve the most funding
3. What is the amount of funding provided across the calendar year(do some months get more funding then others?)


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