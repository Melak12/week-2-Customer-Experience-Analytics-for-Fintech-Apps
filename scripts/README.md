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

## Database Integration

### Overview
This project supports storing and managing cleaned and processed review data in a local PostgreSQL database (`bank_reviews`). Database operations are handled by two scripts:
- `db_manager.py`: Handles connection management and table creation.
- `db_io.py`: Handles saving, fetching, and clearing review and bank data.

### Database Setup

#### 1. Environment Variables
Database credentials are read from a `.env` file. Example `.env`:
```
DB_NAME=bank_reviews
DB_USER=postgres
DB_PASSWORD=yourpassword
DB_HOST=localhost
DB_PORT=5432
```

#### 2. Table Creation
To create the required tables, run:
```python
## On the terminal
> python scripts/db_manager.py 

## In the code
from scripts.db_manager import DBManager

db = DBManager()
db.create_tables()
db.close()
```
This will create two tables if they do not exist:
- `banks`: Stores bank information (id, name, info)
- `reviews`: Stores processed reviews and sentiment data (id, bank_id, review, date, source, processed_review, bert_sentiment, bert_score, vader_score, vader_sentiment, textblob_score, textblob_sentiment)

#### 3. Saving and Fetching Data
Use `db_io.py` for all data operations:

- **Saving reviews:**
```python
from scripts.db_io import DBIO
import pandas as pd

dfio = DBIO()
dfio.save_reviews('CBE', reviews_df)  # reviews_df is your processed DataFrame
dfio.close()
```
- **Fetching reviews:**
```python
dfio = DBIO()
df = dfio.fetch_reviews('CBE')  # Fetch reviews for CBE
dfio.close()
```
- **Clearing reviews for a bank:**
```python
dfio = DBIO()
dfio.clear_reviews_for_bank('CBE')
dfio.close()
```

#### 4. Integration with Sentiment Analysis
The `compute_sentiment()` method in `sentiment_analysis.py` automatically saves sentiment results to the database and clears existing reviews for the bank before saving new ones to avoid duplication.

#### 5. Table Schema
- **banks**
    - `id` (SERIAL PRIMARY KEY)
    - `name` (VARCHAR, unique)
    - `info` (JSONB, optional)
- **reviews**
    - `id` (SERIAL PRIMARY KEY)
    - `bank_id` (INTEGER, foreign key to banks)
    - `review` (TEXT)
    - `date` (TIMESTAMP)
    - `source` (VARCHAR)
    - `processed_review` (TEXT)
    - `bert_sentiment` (VARCHAR)
    - `bert_score` (FLOAT)
    - `vader_score` (FLOAT)
    - `vader_sentiment` (VARCHAR)
    - `textblob_score` (FLOAT)
    - `textblob_sentiment` (VARCHAR)

#### 6. Requirements
- `psycopg2`
- `python-dotenv`

Install with:
```
pip install psycopg2-binary python-dotenv
```

#### 7. Notes
- All database operations are modular and reusable.
- Table and column names are lowercase for PostgreSQL compatibility.
- The database must be running locally and accessible with the credentials in your `.env` file.

## Insights Module

The `insights.py` script provides a modular and notebook-friendly class for deriving actionable insights, visualizations, and recommendations from processed fintech app review data. It is designed to work with review data fetched from the database (via `db_io.py`) and supports both reporting and visualization tasks for downstream analytics and presentations.

### Key Class: `Insights`

#### Initialization
- **`Insights(df)`**: Accepts a pandas DataFrame containing processed review data (with columns such as `bank`, `review`, `date`, `processed_review`, `bert_sentiment`, etc.).
- On initialization, computes:
  - Top positive keywords (drivers)
  - Top negative keywords (pain points)
  - Sentiment distribution by bank
  - Predefined recommendations

#### Methods

- **`get_top_keywords(sentiment_col, n=10, positive=True)`**
  - Returns the top `n` keywords from the `processed_review` column for either positive or negative sentiment, based on the specified sentiment column (e.g., `bert_sentiment`).

- **`plot_sentiment_by_bank()`**
  - Displays a countplot (bar chart) of review sentiment (positive/negative) for each bank using Seaborn and Matplotlib.
  - Useful for comparing customer experience across banks.

- **`plot_sentiment_trend()`**
  - Plots the monthly trend of review sentiment for each bank over time.
  - Helps identify changes in customer sentiment and the impact of product updates or events.

- **`plot_wordcloud(label)`**
  - Displays a word cloud of the most frequent keywords for either 'drivers' (positive) or 'pain_points' (negative) reviews.
  - Useful for quickly visualizing the main topics or issues mentioned by users.

- **`plot_rating_distribution()`**
  - Plots the distribution of user ratings (if the `rating` column is present in the DataFrame).
  - Helps assess overall customer satisfaction.

- **`report_drivers()`**
  - Returns the top positive keywords (drivers) as a pandas Series.

- **`report_pain_points()`**
  - Returns the top negative keywords (pain points) as a pandas Series.

- **`report_bank_sentiment()`**
  - Returns a DataFrame showing the count of each sentiment label per bank.

- **`report_recommendations()`**
  - Returns a list of actionable recommendations for app improvement, based on common drivers and pain points.

- **`report_ethics_note()`**
  - Returns a note on potential review bias (e.g., self-selection bias, negative skew).

#### Usage Example

```python
from scripts.db_io import DBIO
from scripts.insights import Insights

dbio = DBIO()
df = dbio.fetch_reviews()
dbio.close()
insights = Insights(df)

# Display top drivers and pain points
print(insights.report_drivers())
print(insights.report_pain_points())

# Visualize sentiment by bank
insights.plot_sentiment_by_bank()

# Visualize sentiment trend
insights.plot_sentiment_trend()

# Visualize word clouds
insights.plot_wordcloud('drivers')
insights.plot_wordcloud('pain_points')

# Visualize rating distribution
insights.plot_rating_distribution()

# Show recommendations and ethics note
print(insights.report_recommendations())
print(insights.report_ethics_note())
```

#### Notes
- All visualization methods display plots inline (using `plt.show()`), making them ideal for Jupyter notebooks.
- The class is modular: each insight or visualization is a separate method for flexible use in reports or dashboards.
- The class expects preprocessed and sentiment-labeled data (see `sentiment_analysis.py` for upstream processing).
- Recommendations are generic and can be customized based on further analysis.

---

For questions or issues, please refer to the code comments or contact the project maintainer.
