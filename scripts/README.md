# Customer Experience Analytics for Fintech Apps: Google Play Review Scraper

This module provides tools to scrape, preprocess, and schedule the collection of user reviews from the Google Play Store for selected Ethiopian fintech banking apps. The reviews are stored in CSV format and can be further cleaned for downstream analytics.

## Features
- **AppName Enum**: Restricts scraping to predefined bank apps (CBE, BOA, DASHEN).
- **Scraping**: Downloads user reviews for a given app from the Google Play Store and saves them to a CSV file in the `Data/` directory.
- **Preprocessing**: Cleans the raw review data by removing duplicates, handling missing values, normalizing dates, and saving the cleaned data to `Data/cleaned/`.
- **Scheduling**: Supports periodic scraping using the `schedule` library.
- **Logging**: All major actions and errors are logged for traceability.

## Supported Apps
- CBE (Commercial Bank of Ethiopia)
- BOA (Bank of Abyssinia)
- DASHEN (Dashen Bank)

## File Structure
- `scripts/app_review_scrapper.py`: Main script for scraping and preprocessing reviews.
- `Data/`: Stores raw review CSVs (e.g., `cbe_reviews.csv`).
- `Data/cleaned/`: Stores cleaned review CSVs (e.g., `cbe_reviews_cleaned.csv`).

## Usage

### 1. Scraping Reviews
```python
from scripts.app_review_scrapper import AppReviewScraper, AppName
scraper = AppReviewScraper(num_reviews=400)
scraper.scrape_reviews(AppName.CBE)  # For CBE
```
- Output: `Data/cbe_reviews.csv`

### 2. Preprocessing Reviews
```python
scraper.preprocess_reviews(AppName.CBE)
```
- Output: `Data/cleaned/cbe_reviews_cleaned.csv`
- Columns: `review`, `rating`, `date`, `bank`, `source`

### 3. Scheduling Scraping
```python
scraper.scheduled_scrape(AppName.CBE, interval_minutes=60)
```
- Scrapes reviews every 60 minutes.

## Preprocessing Details
- **Duplicates**: Removed based on `reviewId`, `userName`, and `content`.
- **Missing Data**: Rows missing `content`, `score`, or `at` (date) are dropped.
- **Date Normalization**: Dates are converted to `YYYY-MM-DD` format.
- **Final Columns**: Only relevant columns are kept and renamed for analytics.

## Error Handling
- If the raw review file does not exist during preprocessing, a `FileNotFoundError` is raised with a clear message.

## Requirements
- Python 3.7+
- Packages: `google-play-scraper`, `schedule`, `pandas`, `csv`, `logging`

Install requirements with:
```
pip install google-play-scraper schedule pandas
```

## Notes
- Only the apps defined in the `AppName` enum are supported.
- All output files are automatically named and stored in the correct folders.
- Logging output provides progress and error information.

## Example
```python
from scripts.app_review_scrapper import AppReviewScraper, AppName
scraper = AppReviewScraper(num_reviews=200)
scraper.scrape_reviews(AppName.BOA)
scraper.preprocess_reviews(AppName.BOA)
```

---

For questions or issues, please refer to the code comments or contact the project maintainer.
