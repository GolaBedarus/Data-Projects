import os
import time
from datetime import datetime
from urllib.parse import urljoin

import pandas as pd
import requests
from bs4 import BeautifulSoup

from src.logger_config import setup_logger

BASE_URL = "https://books.toscrape.com/catalogue/page-{}.html"
CATALOGUE_BASE = "https://books.toscrape.com/catalogue/"

logger = setup_logger("scraper")


def parse_rating(star_tag):
    classes = star_tag.get("class", [])
    rating_map = {
        "One": 1,
        "Two": 2,
        "Three": 3,
        "Four": 4,
        "Five": 5,
    }

    for class_name in classes:
        if class_name in rating_map:
            return rating_map[class_name]

    return None


def scrape_page(page_num, retries=3, delay=2):
    url = BASE_URL.format(page_num)

    for attempt in range(1, retries + 1):
        try:
            logger.info(f"Requesting page {page_num}: attempt {attempt}")
            response = requests.get(url, timeout=30)
            response.raise_for_status()

            soup = BeautifulSoup(response.text, "html.parser")
            books = []

            for article in soup.select("article.product_pod"):
                title_tag = article.select_one("h3 a")
                price_tag = article.select_one(".price_color")
                stock_tag = article.select_one(".availability")
                rating_tag = article.select_one("p.star-rating")

                relative_url = title_tag["href"]
                product_url = urljoin(CATALOGUE_BASE, relative_url)

                books.append(
                    {
                        "title": title_tag["title"].strip(),
                        "price_raw": price_tag.get_text(strip=True),
                        "availability_raw": stock_tag.get_text(" ", strip=True),
                        "rating": parse_rating(rating_tag),
                        "product_page_url": product_url,
                        "scraped_at": datetime.utcnow().isoformat(),
                    }
                )

            logger.info(f"Page {page_num} scraped successfully with {len(books)} books.")
            return books

        except requests.RequestException as e:
            logger.warning(f"Error scraping page {page_num} on attempt {attempt}: {e}")
            time.sleep(delay)

    logger.error(f"Failed to scrape page {page_num} after {retries} attempts.")
    return []


def main():
    logger.info("Starting scraping process.")
    all_books = []

    for page in range(1, 51):
        books = scrape_page(page)
        all_books.extend(books)

    df = pd.DataFrame(all_books)

    os.makedirs("data/raw", exist_ok=True)

    csv_output_path = "data/raw/books_raw.csv"
    parquet_output_path = "data/raw/books_raw.parquet"

    df.to_csv(csv_output_path, index=False, sep=";", encoding="utf-8-sig")
    df.to_parquet(parquet_output_path, index=False)

    logger.info(f"Raw CSV data saved to {csv_output_path}")
    logger.info(f"Raw Parquet data saved to {parquet_output_path}")
    logger.info(f"Total records scraped: {len(df)}")

if __name__ == "__main__":
    main()