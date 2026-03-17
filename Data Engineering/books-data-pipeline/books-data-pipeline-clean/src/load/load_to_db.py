import os
import time

import pandas as pd
from dotenv import load_dotenv
from sqlalchemy import create_engine
from sqlalchemy.exc import OperationalError

from src.logger_config import setup_logger

logger = setup_logger("load")

load_dotenv()

DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")
DB_HOST = os.getenv("DB_HOST")
DB_PORT = os.getenv("DB_PORT")
DB_NAME = os.getenv("DB_NAME")

DB_URI = (
    f"postgresql+psycopg2://{DB_USER}:{DB_PASSWORD}"
    f"@{DB_HOST}:{DB_PORT}/{DB_NAME}"
)


def get_engine_with_retry(retries=10, delay=3):
    for attempt in range(1, retries + 1):
        try:
            engine = create_engine(DB_URI)
            with engine.connect():
                logger.info("Database connection successful.")
            return engine
        except OperationalError:
            logger.warning(f"Database not ready. Retry {attempt}/{retries}...")
            time.sleep(delay)

    logger.error("Could not connect to the database after multiple retries.")
    raise Exception("Database connection failed.")


def main():
    input_path = "data/processed/books_clean.csv"

    try:
        logger.info(f"Reading processed data from {input_path}")
        df = pd.read_csv(input_path, sep=";", encoding="utf-8-sig")

        engine = get_engine_with_retry()

        df.to_sql(
            "books",
            con=engine,
            if_exists="append",
            index=False,
        )

        logger.info(f"Loaded {len(df)} records into PostgreSQL.")

    except FileNotFoundError:
        logger.error(f"Processed file not found: {input_path}")
        raise
    except Exception as e:
        logger.error(f"Unexpected error during database load: {e}")
        raise


if __name__ == "__main__":
    main()