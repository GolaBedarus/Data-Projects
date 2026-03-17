from src.scraping.scraper import main as scrape_main
from src.transform.clean_data import main as transform_main
from src.load.load_to_db import main as load_main
from src.logger_config import setup_logger

logger = setup_logger("pipeline")


def main():
    try:
        logger.info("Pipeline execution started.")

        logger.info("Starting scraping step.")
        scrape_main()

        logger.info("Starting transformation step.")
        transform_main()

        logger.info("Starting load step.")
        load_main()

        logger.info("Pipeline finished successfully.")

    except Exception as e:
        logger.error(f"Pipeline failed: {e}")
        raise


if __name__ == "__main__":
    main()