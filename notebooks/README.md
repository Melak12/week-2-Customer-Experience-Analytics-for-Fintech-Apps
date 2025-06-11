## Data Profiling, Cleaning & EDA Process

The following steps were performed for each stock dataset as documented in the Jupyter notebooks in the `notebooks/` directory:

## Exploratory Data Analysis (EDA) Notebooks

The `notebooks/` directory contains Jupyter notebooks for performing data profiling, cleaning, and exploratory data analysis (EDA) on user reviews collected from Google Play for Ethiopian fintech banking apps. Each notebook is tailored for a specific bank and follows a consistent analysis workflow.

### Notebook Structure and Workflow

Each EDA notebook (e.g., `cbe_eda.ipynb`, `boa_eda.ipynb`, `dashen_eda.ipynb`) includes the following steps:

1. **Environment Setup**
   - Loads the autoreload extension for IPython to automatically reload modules before executing code.
   - Updates the system path to ensure scripts in the parent directory are importable.

2. **Importing Modules**
   - Imports core analysis classes and enums from `scripts.utils` and `scripts.sentiment_analysis`.
   - Loads pandas for data manipulation.

3. **Data Loading**
   - Loads the cleaned review data for the respective bank from `../Data/cleaned/<bank>_reviews_cleaned.csv`.
   - Displays the first few rows to verify data integrity.

4. **Analysis Initialization**
   - Instantiates the `SentimentAnalysis` class with the loaded DataFrame and the appropriate `AppName` enum value.

5. **Text Preprocessing**
   - Calls `preprocess_reviews()` to tokenize, lowercase, remove stopwords, and lemmatize the review text.
   - Adds a `processed_review` column to the DataFrame.

6. **Sentiment Analysis**
   - Computes sentiment using three different methods:
     - BERT (`SentimentMethod.BERT`)
     - VADER (`SentimentMethod.VADER`)
     - TextBlob (`SentimentMethod.TEXT_BLOB`)
   - Each method adds sentiment labels and scores to the DataFrame and saves the results to a gold CSV file in `../Data/gold/`.

7. **Sentiment Distribution Visualization**
   - Plots a grouped bar chart showing the distribution of positive, neutral, and negative reviews for all computed sentiment methods.

8. **Keyword Extraction**
   - Extracts and displays the top keywords from positive and negative reviews using the selected sentiment method (typically BERT).
   - Optionally visualizes keywords as word clouds for each sentiment.

9. **Theme Extraction and Visualization**
   - Groups related keywords and phrases into 3-5 overarching themes (e.g., 'Account Access Issues', 'Transaction Performance', etc.) using rule-based keyword matching.
   - Visualizes the theme map as a horizontal bar chart, showing the count of keywords/phrases per theme.

### Available Notebooks

- `cbe_eda.ipynb`: EDA for Commercial Bank of Ethiopia (CBE) app reviews.
- `boa_eda.ipynb`: EDA for Bank of Abyssinia (BOA) app reviews.
- `dashen_eda.ipynb`: EDA for Dashen Bank app reviews.

Each notebook is self-contained and can be run independently to analyze the respective bank's user reviews.

### How to Use

1. Open the desired notebook in Jupyter or VS Code.
2. Run each cell sequentially to:
   - Load and preprocess the data
   - Compute and visualize sentiment
   - Extract and visualize keywords and themes
3. Modify parameters (e.g., `top_n`, `method`) as needed for deeper analysis.

### Requirements
- Python 3.7+
- pandas, nltk, transformers, textblob, wordcloud, spacy, seaborn, matplotlib
- For BERT: `transformers` and internet access for model download
- For spaCy keyword extraction: `spacy` and `en_core_web_sm` model

### Notes
- The notebooks assume that cleaned review data is available in the `Data/cleaned/` directory.
- All outputs (plots, CSVs) are automatically generated and saved in the appropriate folders.
- The workflow is designed to be extensible for additional banks or analysis steps.