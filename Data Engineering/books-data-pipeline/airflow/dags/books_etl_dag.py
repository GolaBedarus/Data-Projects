from datetime import datetime
import sys

from airflow import DAG
from airflow.operators.python import PythonOperator

# 👇 esto es clave
sys.path.append("/opt/project")

from src.scraping.scraper import main as scrape_main
from src.transform.clean_data import main as transform_main
from src.load.load_to_db import main as load_main


with DAG(
    dag_id="books_etl_pipeline",
    start_date=datetime(2025, 1, 1),
    schedule="@daily",
    catchup=False,
    tags=["portfolio", "etl", "books"],
) as dag:

    scrape_task = PythonOperator(
        task_id="scrape_books",
        python_callable=scrape_main,
    )

    transform_task = PythonOperator(
        task_id="transform_books",
        python_callable=transform_main,
    )

    load_task = PythonOperator(
        task_id="load_books_to_postgres",
        python_callable=load_main,
    )

    scrape_task >> transform_task >> load_task