import logging
import time
import schedule
import csv
import os
from datetime import datetime
from google_play_scraper import Sort, reviews
from enum import Enum

# This script scrapes user reviews from the Google Play Store for a specified app.
# It saves the reviews to a CSV file inside the Data directory and can be scheduled to run at regular intervals.

# Application name and id mapping to be used for scraping
class AppName(Enum):
    CBE = 'CBE'
    BOA = 'BOA'
    DASHEN = 'DASHEN'

APP_NAME_ID_MAPPING = {
    AppName.CBE: 'com.combanketh.mobilebanking',
    AppName.BOA: 'com.boa.boaMobileBanking',
    AppName.DASHEN: 'com.dashen.dashensuperapp',
}

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

class AppReviewScraper:
    def __init__(self, num_reviews=400):
        self.num_reviews = num_reviews
        pass

    def get_appid(self, app_name: 'AppName'):
        """
        Get the app ID for a given app name (AppName enum).
        """
        if app_name in APP_NAME_ID_MAPPING:
            return APP_NAME_ID_MAPPING[app_name]
        else:
            logging.error(f"App name '{app_name}' not found in mapping.")
            return None

    def scrape_reviews(self, app_name: 'AppName'):
        """
        Scrape user reviews from Google Play Store for a given app_name (AppName enum) and save to CSV.
        """
        app_id = self.get_appid(app_name)
        if not app_id:
            logging.error(f"Invalid app name: {app_name}")
            return

        # Set default csv_filename if not provided
        csv_filename = f"{app_name.value.lower()}_reviews.csv"

        logging.info(f"Starting to scrape reviews for app: {app_id}")
        all_reviews = []
        count = 0
        next_token = None
        while count < self.num_reviews:
            try:
                result, next_token = reviews(
                    app_id,
                    lang='en',
                    country='us',
                    sort=Sort.NEWEST,
                    count=min(100, self.num_reviews - count),
                    continuation_token=next_token
                )
                all_reviews.extend(result)
                count += len(result)
                if not next_token:
                    break
                time.sleep(1)
            except Exception as e:
                logging.error(f"Error while scraping: {e}")
                break
        # Ensure Data directory exists
        data_dir = os.path.join(os.path.dirname(os.path.dirname(__file__)), 'Data')
        os.makedirs(data_dir, exist_ok=True)
        csv_path = os.path.join(data_dir, csv_filename)
        logging.info(f"Scraped {len(all_reviews)} reviews. Saving to {csv_path}")
        with open(csv_path, mode='w', newline='', encoding='utf-8') as file:
            writer = csv.writer(file)
            writer.writerow(['reviewId', 'userName', 'content', 'score', 'thumbsUpCount', 'date',])
            for review in all_reviews:
                writer.writerow([
                    review.get('reviewId'),
                    review.get('userName'),
                    review.get('content'),
                    review.get('score'),
                    review.get('thumbsUpCount'),
                    review.get('at')
                ])
        logging.info("Reviews saved successfully.")

    def scheduled_scrape(self, app_name, interval_minutes=60):
        schedule.every(interval_minutes).minutes.do(self.scrape_reviews, app_name)
        logging.info(f"Scheduled scraping every {interval_minutes} minutes.")
        while True:
            schedule.run_pending()
            time.sleep(1)

