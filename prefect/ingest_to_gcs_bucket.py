from pathlib import Path
import pandas as pd
from prefect import flow, task
from prefect_gcp.cloud_storage import GcsBucket
from random import randint



# @task(retries=3)
# def fetch(dataset_url: str) -> pd.DataFrame:
#     """Read taxi data from web into pandas DataFrame"""
#     df = pd.read_csv(dataset_url)
#     return df


# @task(log_prints=True)
# def clean(df: pd.DataFrame) -> pd.DataFrame:
#     """Fix dtype issues"""
#     df["lpep_pickup_datetime"] = pd.to_datetime(df["lpep_pickup_datetime"])
#     df["lpep_dropoff_datetime"] = pd.to_datetime(df["lpep_dropoff_datetime"])
#     print(df.head(2))
#     print(f"columns: {df.dtypes}")
#     print(f"rows: {len(df)}")
#     return df


# @task()
# def write_local(df: pd.DataFrame, color: str, dataset_file: str) -> Path:
#     """Write DataFrame out locally as parquet file"""
#     path = Path(f"data/{color}/{dataset_file}.parquet")
#     df.to_parquet(path, compression="gzip")
#     return path


@task()
def write_gcs(bucket: str) -> None:
    """Upload local parquet file to GCS"""
    
    gcs_block = GcsBucket.load(bucket)
    #gcs_block = GcsBucket.load("data-engineering-zoomcamp")
    path = '/home/antihaddock/Repos/data_engineering_camp_project/data/research_payments.csv'
    gcs_path = '/data/'
    gcs_block.upload_from_path(from_path=path, to_path=gcs_path, timeout=None)
    return


@flow()
def etl_web_to_gcs() -> None:
    """The main ETL function"""
    gcs_bucket_name = "engineering-camp"
    write_gcs(gcs_bucket_name)

if __name__ == "__main__":
    etl_web_to_gcs()
