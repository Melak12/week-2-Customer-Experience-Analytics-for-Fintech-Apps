from collections import Counter
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import nltk
from nltk.corpus import stopwords
from nltk import word_tokenize, ngrams, FreqDist
from nltk.sentiment import SentimentIntensityAnalyzer
from nltk.stem import WordNetLemmatizer
import logging
from transformers import pipeline
from enum import Enum
from textblob import TextBlob
from wordcloud import WordCloud

from scripts.utils import AppName

## This script performs sentiment analysis and keyword extraction on financial app reviews based on the data provided in a DataFrame which is loaded from ../Data/cleaned/<appName>_reviews_cleaned.csv (e.g. ../Data/cleaned/cbe_reviews_cleaned.csv).

## The Data Frame has the following columns:
# - review: The text content of the review
# - rating: The star rating given by the user
# - date: The date when the review was posted
# - bank: The name of the bank (app) the review is for
# - source: The source of the review (e.g. Google Play Store)

class SentimentMethod(Enum):
    VADER = 'vader'
    BERT = 'bert'
    TEXT_BLOB = 'text_blob'

class SentimentAnalysis:
    def __init__(self, df, app_name: 'AppName'):
        self.df = df
        self.app_name = app_name
        self.ensure_nltk_resources()
        self.sia = SentimentIntensityAnalyzer()
        # self.bert_sentiment = pipeline('sentiment-analysis', model='distilbert-base-uncased-finetuned-sst-2-english')

    def format_datetime(self):
        # Convert 'date' column to datetime format
        if 'date' in self.df.columns:
            self.df['date'] = pd.to_datetime(self.df['date'], errors='coerce', utc=True)
            self.df['year'] = self.df['date'].dt.year
            self.df['month'] = self.df['date'].dt.month
            self.df['day'] = self.df['date'].dt.day
            self.df['hour'] = self.df['date'].dt.hour
            self.df['minute'] = self.df['date'].dt.minute
            self.df['dayOfWeek'] = self.df['date'].dt.dayofweek
            self.df['date_only'] = self.df['date'].dt.date
            self.df['weekday'] = self.df['date'].dt.day_name()
            print("Date column formatted to datetime.")
        else:
            print("No 'date' column found in DataFrame.")

   

    def ensure_nltk_resources(self):
        # Ensure NLTK resources are available
        print("Checking for NLTK resources...")
        try:
            import nltk
        except ImportError:
            raise ImportError("NLTK is not installed. Please install it using 'pip install nltk'.")
        try:
            nltk.data.find('tokenizers/punkt')
            nltk.data.find('corpora/stopwords')
            nltk.data.find('corpora/wordnet')
            nltk.data.find('sentiment/vader_lexicon.zip')
            print("NLTK resources are available.")
        except LookupError:
            print("NLTK resources not found. Downloading...")
            nltk.download('punkt', quiet=True)
            nltk.download('stopwords', quiet=True)
            nltk.download('wordnet', quiet=True)
            nltk.download('vader_lexicon', quiet=True)
            print("NLTK resources downloaded.")

    def preprocess_reviews(self):
        # Preprocess reviews: remove stop words, tokenize, lemmatize, and extract n-grams
        print("Preprocessing reviews...")
        def preprocess_text(text):
            tokens = word_tokenize(str(text).lower())
            stop_words = set(stopwords.words('english'))
            lemmatizer = WordNetLemmatizer()
            tokens = [lemmatizer.lemmatize(word) for word in tokens if word.isalnum() and word not in stop_words]
            
            return ' '.join(tokens)

        self.df['processed_review'] = self.df['review'].apply(preprocess_text)
        print("Reviews preprocessed. Tokens extracted.")
        

    def compute_bert_sentiment(self):
        # Compute DistilBERT sentiment for each review
        def get_bert_label(text):
            try:
                result = self.bert_sentiment(str(text))[0]
                label = result['label'].lower()
                score = result['score']
                # Map to positive/negative/neutral
                if label == 'positive':
                    return ('positive', score)
                elif label == 'negative':
                    return ('negative', score)
                else:
                    return ('neutral', score)
            except Exception as e:
                return ('neutral', 0.0)
        bert_results = self.df['processed_review'].apply(get_bert_label)
        self.df['bert_sentiment'] = bert_results.apply(lambda x: x[0])
        self.df['bert_score'] = bert_results.apply(lambda x: x[1])
        print("DistilBERT sentiment scores computed.")
    
    def compute_vader_sentiment(self):
        # Compute VADER sentiment scores for each review
        print("Computing VADER sentiment scores...")
        self.df['vader_score'] = self.df['processed_review'].apply(lambda x: self.sia.polarity_scores(str(x))['compound'])
    
        # classify sentiment based on compound score
        self.df['vader_sentiment'] = self.df['vader_score'].apply(lambda x: 'positive' if x > 0.05 else ('negative' if x < -0.05 else 'neutral'))
        print("VADER sentiment scores computed.")

    def compute_textblob_sentiment(self):
        # Compute TextBlob sentiment polarity for each review
        print("Computing TextBlob sentiment scores...")
        self.df['textblob_score'] = self.df['processed_review'].apply(lambda x: TextBlob(str(x)).sentiment.polarity)
        # classify sentiment based on polarity
        self.df['textblob_sentiment'] = self.df['textblob_score'].apply(lambda x: 'positive' if x > 0.05 else ('negative' if x < -0.05 else 'neutral'))
        print("TextBlob sentiment scores computed.")

    def aggregate_sentiment_by_rating(self,  method: SentimentMethod = SentimentMethod.VADER):
        # Aggregate mean sentiment score by rating
        if method == SentimentMethod.BERT:
            # For BERT, use bert_score (probability of predicted label)
            agg = self.df.groupby('rating')['bert_score'].mean().reset_index(name='mean_bert_score')
        elif method == SentimentMethod.VADER:
            agg = self.df.groupby('rating')['vader_score'].mean().reset_index(name='mean_vader_score')
        else:
            raise ValueError('Unknown method for aggregation')
        print(f"Aggregated sentiment by rating using {SentimentMethod[method]}:")
        print(agg)
        return agg

    def plot_sentiment_distribution(self):
        """
        Visualize the sentiment distribution for all sentiment methods (VADER, BERT, TEXT_BLOB) in a single grouped bar chart.
        """
        # Collect available sentiment columns
        sentiment_methods = {
            'VADER': 'vader_sentiment',
            'BERT': 'bert_sentiment',
            'TEXT_BLOB': 'textblob_sentiment'
        }
        available_methods = [(name, col) for name, col in sentiment_methods.items() if col in self.df.columns]
        if not available_methods:
            print("No sentiment columns found. Please compute sentiment first.")
            return
        # Prepare data for grouped bar plot
        sentiment_counts = []
        for method, col in available_methods:
            counts = self.df[col].value_counts().reindex(['positive', 'neutral', 'negative'], fill_value=0)
            for sentiment, count in counts.items():
                sentiment_counts.append({'Method': method, 'Sentiment': sentiment, 'Count': count})
        plot_df = pd.DataFrame(sentiment_counts)
        plt.figure(figsize=(8, 6))
        sns.barplot(data=plot_df, x='Sentiment', y='Count', hue='Method', palette='viridis')
        plt.title(f"Sentiment Distribution by Method for {self.app_name.value}")
        plt.xlabel("Sentiment")
        plt.ylabel("Count")
        plt.legend(title='Method')
        plt.tight_layout()
        plt.show()
    
    def keyword_extraction(self, method: SentimentMethod = SentimentMethod.VADER, top_n: int = 15, plot_wordcloud: bool = True):
        """
        Extract and display top keywords from positive and negative reviews for the specified sentiment method.
        Optionally, plot word clouds for each sentiment.
        Args:
            method (SentimentMethod): The sentiment method to use for filtering reviews.
            top_n (int): Number of top keywords to extract for each sentiment.
            plot_wordcloud (bool): Whether to plot word clouds for positive and negative reviews.
        """
        
        # Map method to sentiment column
        method_col_map = {
            SentimentMethod.VADER: 'vader_sentiment',
            SentimentMethod.BERT: 'bert_sentiment',
            SentimentMethod.TEXT_BLOB: 'textblob_sentiment',
        }
        col = method_col_map.get(method)
        if col not in self.df.columns:
            print(f"Sentiment column '{col}' not found. Please compute sentiment using {method.value} first.")
            return
        stop_words = set(stopwords.words('english'))
        lemmatizer = WordNetLemmatizer()
        def extract_keywords(texts):
            tokens = []
            for text in texts:
                words = word_tokenize(str(text).lower())
                words = [lemmatizer.lemmatize(w) for w in words if w.isalnum() and w not in stop_words]
                tokens.extend(words)
            return Counter(tokens).most_common(top_n), ' '.join(tokens)
        keywords = {}
        wordcloud_texts = {}
        for sentiment in ['positive', 'negative']:
            reviews = self.df[self.df[col] == sentiment]['review']
            keywords[sentiment], wordcloud_texts[sentiment] = extract_keywords(reviews)
        print(f"Top {top_n} keywords in positive reviews ({method.value}):")
        print(keywords['positive'])
        print(f"\nTop {top_n} keywords in negative reviews ({method.value}):")
        print(keywords['negative'])
        if plot_wordcloud:
            import matplotlib.pyplot as plt
            fig, axes = plt.subplots(1, 2, figsize=(16, 7))
            for idx, sentiment in enumerate(['positive', 'negative']):
                wc = WordCloud(width=800, height=400, background_color='white', colormap='Greens' if sentiment=='positive' else 'Reds').generate(wordcloud_texts[sentiment])
                axes[idx].imshow(wc, interpolation='bilinear')
                axes[idx].set_title(f"{sentiment.capitalize()} Reviews WordCloud ({method.value})", fontsize=16)
                axes[idx].axis('off')
            plt.tight_layout()
            plt.show()
        return keywords