import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import nltk
from nltk.corpus import stopwords
from nltk import word_tokenize, ngrams, FreqDist
from nltk.sentiment import SentimentIntensityAnalyzer
import logging
from transformers import pipeline

from scripts.utils import AppName

## This script performs sentiment analysis and keyword extraction on financial app reviews based on the data provided in a DataFrame which is loaded from ../Data/cleaned/<appName>_reviews_cleaned.csv (e.g. ../Data/cleaned/cbe_reviews_cleaned.csv).

## The Data Frame has the following columns:
# - review: The text content of the review
# - rating: The star rating given by the user
# - date: The date when the review was posted
# - bank: The name of the bank (app) the review is for
# - source: The source of the review (e.g. Google Play Store)

class SentimentAnalysis:
    def __init__(self, df, app_name: 'AppName'):
        self.df = df
        self.app_name = app_name
        self.stop_words = set(stopwords.words('english'))
        self.sia = SentimentIntensityAnalyzer()
        self.bert_sentiment = pipeline('sentiment-analysis', model='distilbert-base-uncased-finetuned-sst-2-english')

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

    def compute_vader_sentiment(self):
        # Compute VADER sentiment scores for each review
        self.df['vader_compound'] = self.df['review'].apply(lambda x: self.sia.polarity_scores(str(x))['compound'])
        self.df['vader_sentiment'] = self.df['vader_compound'].apply(lambda x: 'positive' if x > 0.05 else ('negative' if x < -0.05 else 'neutral'))
        print("VADER sentiment scores computed.")

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
        bert_results = self.df['review'].apply(get_bert_label)
        self.df['bert_sentiment'] = bert_results.apply(lambda x: x[0])
        self.df['bert_score'] = bert_results.apply(lambda x: x[1])
        print("DistilBERT sentiment scores computed.")

    def aggregate_sentiment_by_rating(self, method='bert'):
        # Aggregate mean sentiment score by rating
        if method == 'bert':
            # For BERT, use bert_score (probability of predicted label)
            agg = self.df.groupby('rating')['bert_score'].mean().reset_index(name='mean_bert_score')
        elif method == 'vader':
            agg = self.df.groupby('rating')['vader_compound'].mean().reset_index(name='mean_vader_compound')
        else:
            raise ValueError('Unknown method for aggregation')
        print(f"Aggregated sentiment by rating using {method}:")
        print(agg)
        return agg