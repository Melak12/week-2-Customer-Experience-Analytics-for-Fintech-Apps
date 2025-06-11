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

## Sentiment Analysis Module

The `sentiment_analysis.py` script provides a comprehensive suite for performing sentiment analysis, keyword extraction, and theme grouping on financial app reviews. It is designed to work with cleaned review data (see preprocessing steps) and supports multiple sentiment analysis methods, advanced keyword extraction, and insightful visualizations.

### Key Classes and Enums

- **SentimentMethod (Enum):**
  - `VADER`: Uses NLTK's VADER for rule-based sentiment analysis.
  - `BERT`: Uses a pre-trained DistilBERT transformer model for deep learning-based sentiment analysis.
  - `TEXT_BLOB`: Uses TextBlob for lexicon-based sentiment analysis.

- **SentimentAnalysis:**
  - Main class for all sentiment, keyword, and theme analysis tasks.
  - Initialized with a DataFrame of reviews and an `AppName` enum value.

### Main Methods

- **format_datetime()**
  - Converts the 'date' column to pandas datetime and extracts year, month, day, hour, minute, weekday, etc.

- **ensure_nltk_resources()**
  - Checks and downloads required NLTK resources for tokenization, stopwords, lemmatization, and VADER.

- **preprocess_reviews()**
  - Tokenizes, lowercases, removes stopwords, and lemmatizes review text.
  - Adds a `processed_review` column to the DataFrame.

- **compute_sentiment(method, save_gold=True)**
  - Computes sentiment using the specified method (`VADER`, `BERT`, or `TEXT_BLOB`).
  - Internally calls private methods for each algorithm:
    - `_compute_vader_sentiment()`
    - `_compute_bert_sentiment()`
    - `_compute_textblob_sentiment()`
  - Saves the DataFrame with sentiment columns to `../Data/gold/<bankName>_reviews_gold.csv`.

- **_compute_vader_sentiment()** (private)
  - Uses VADER to compute sentiment scores and labels for each review.

- **_compute_bert_sentiment()** (private)
  - Uses HuggingFace's DistilBERT pipeline to compute sentiment labels and confidence scores.

- **_compute_textblob_sentiment()** (private)
  - Uses TextBlob to compute polarity and sentiment labels for each review.

- **aggregate_sentiment_by_rating(method)**
  - Aggregates and prints the mean sentiment score by user rating for the selected method.

- **plot_sentiment_distribution()**
  - Plots a grouped bar chart showing the distribution of positive, neutral, and negative reviews for all computed sentiment methods.

- **keyword_extraction(method, top_n=15, plot_wordcloud=True, use_spacy=True)**
  - Extracts top keywords from positive and negative reviews using either spaCy (noun chunks/nouns) or NLTK (tokens/lemmas).
  - Optionally visualizes keywords as word clouds for each sentiment.

- **extract_themes(method, top_n=15, use_spacy=True)**
  - Groups related keywords/phrases into 3-5 high-level themes (e.g., 'Account Access Issues', 'Transaction Performance', etc.) using rule-based keyword matching.
  - Returns and prints the top keywords/phrases for each theme.

- **plot_theme_map(method, top_n=15, use_spacy=True)**
  - Visualizes the theme map as a horizontal bar chart, showing the count of keywords/phrases per theme.

### Data Flow
1. **Preprocessing:**
   - Use `preprocess_reviews()` to clean and lemmatize review text.
2. **Sentiment Analysis:**
   - Use `compute_sentiment()` to compute and save sentiment labels and scores.
3. **Keyword Extraction:**
   - Use `keyword_extraction()` to extract and visualize important keywords for each sentiment.
4. **Theme Grouping:**
   - Use `extract_themes()` and `plot_theme_map()` to group keywords into themes and visualize their prevalence.

### Example Usage
```python
from scripts.sentiment_analysis import SentimentAnalysis, SentimentMethod
from scripts.utils import AppName
import pandas as pd

df = pd.read_csv('../Data/cleaned/cbe_reviews_cleaned.csv')
analysis = SentimentAnalysis(df, AppName.CBE)
analysis.preprocess_reviews()
analysis.compute_sentiment(method=SentimentMethod.BERT)
analysis.plot_sentiment_distribution()
analysis.keyword_extraction(method=SentimentMethod.BERT, top_n=20)
analysis.extract_themes(method=SentimentMethod.BERT)
analysis.plot_theme_map(method=SentimentMethod.BERT)
```

### Requirements
- pandas, nltk, transformers, textblob, wordcloud, spacy, seaborn, matplotlib
- For BERT: `transformers` and internet access for model download
- For spaCy keyword extraction: `spacy` and `en_core_web_sm` model

### Notes
- The gold CSV file is automatically updated with new sentiment columns after each run.
- All visualizations are generated using matplotlib and seaborn.
- The class is designed to be extensible for additional sentiment or theme extraction methods.

---

For questions or issues, please refer to the code comments or contact the project maintainer.
