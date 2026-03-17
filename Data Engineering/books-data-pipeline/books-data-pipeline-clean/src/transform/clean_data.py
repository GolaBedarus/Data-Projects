import os
import re

import pandas as pd

from src.logger_config import setup_logger

logger = setup_logger("transform")


def clean_price(value):
    value = re.sub(r"[^\d.]", "", value)
    return float(value)


def clean_availability(value):
    match = re.search(r"\((\d+) available\)", value)
    if match:
        return int(match.group(1))
    return 0


def main():
    input_path = "data/raw/books_raw.csv"

    try:
        logger.info(f"Reading raw data from {input_path}")
        df = pd.read_csv(input_path, sep=";", encoding="utf-8-sig")

        df["price_gbp"] = df["price_raw"].apply(clean_price)
        df["stock_available"] = df["availability_raw"].apply(clean_availability)

        df = df.drop(columns=["price_raw", "availability_raw"])

        df = df[
            [
                "title",
                "price_gbp",
                "stock_available",
                "rating",
                "product_page_url",
                "scraped_at",
            ]
        ]

        os.makedirs("data/processed", exist_ok=True)

        csv_output_path = "data/processed/books_clean.csv"
        parquet_output_path = "data/processed/books_clean.parquet"

        df.to_csv(csv_output_path, index=False, sep=";", encoding="utf-8-sig")
        df.to_parquet(parquet_output_path, index=False)

        logger.info(f"Processed CSV data saved to {csv_output_path}")
        logger.info(f"Processed Parquet data saved to {parquet_output_path}")
        logger.info(f"Total records transformed: {len(df)}")

    except FileNotFoundError:
        logger.error(f"Input file not found: {input_path}")
        raise
    except Exception as e:
        logger.error(f"Unexpected error during transformation: {e}")
        raise


if __name__ == "__main__":
    main()