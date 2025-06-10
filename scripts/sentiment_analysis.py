import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import nltk
from nltk.corpus import stopwords
from nltk import word_tokenize, ngrams, FreqDist
from nltk.sentiment import SentimentIntensityAnalyzer

from scripts.utils import AppName

## This script performs sentiment analysis and keyword extraction on financial app reviews based on the data provided in a DataFrame which is loaded from ../Data/cleaned/<appName>_reviews_cleaned.csv (e.g. ../Data/cleaned/cbe_reviews_cleaned.csv).


class SentimentAnalysis:
    def __init__(self, df, app_name: 'AppName'):
        self.df = df
        self.app_name = app_name
        self.stop_words = set(stopwords.words('english'))
        self.sia = SentimentIntensityAnalyzer()