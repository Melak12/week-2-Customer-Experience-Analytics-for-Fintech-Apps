# insights.py
"""
Derive insights from sentiment and themes, visualize results, and recommend app improvements.
"""
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from wordcloud import WordCloud
from scripts.db_io import DBIO

class Insights:
    def __init__(self, df):
        self.df = df
        self.drivers = self.get_top_keywords('bert_sentiment', positive=True)
        self.pain_points = self.get_top_keywords('bert_sentiment', positive=False)
        self.bank_sentiment = self.df.groupby(['bank', 'bert_sentiment']).size().unstack(fill_value=0)
        self.recommendations = [
            "Add a budgeting tool to help users manage finances.",
            "Improve app stability to reduce crashes and errors.",
            "Enhance navigation speed and user interface responsiveness."
        ]

    def get_top_keywords(self, sentiment_col, n=10, positive=True):
        subset = self.df[self.df[sentiment_col] == ('positive' if positive else 'negative')]
        words = subset['processed_review'].str.cat(sep=' ').split()
        freq = pd.Series(words).value_counts()
        return freq.head(n)

    def plot_sentiment_by_bank(self):
        plt.figure(figsize=(10, 5))
        sns.countplot(data=self.df, x='bank', hue='bert_sentiment')
        plt.title('Sentiment Distribution by Bank')
        plt.show()
        plt.close()

    def plot_sentiment_trend(self):
        if 'date' in self.df.columns:
            df = self.df.copy()
            df['date'] = pd.to_datetime(df['date'], errors='coerce')
            trend = df.groupby([df['date'].dt.to_period('M'), 'bank'])['bert_sentiment'].value_counts().unstack().fillna(0)
            trend.plot(kind='line', figsize=(12,6))
            plt.title('Monthly Sentiment Trend by Bank')
            plt.ylabel('Review Count')
            plt.show()
            plt.close()

    def plot_wordcloud(self, label):
        words = self.drivers if label == 'drivers' else self.pain_points
        wc = WordCloud(width=800, height=400, background_color='white').generate(' '.join(words.index))
        plt.figure(figsize=(8,4))
        plt.imshow(wc, interpolation='bilinear')
        plt.axis('off')
        plt.title(f'Keyword Cloud: {label.replace("_", " ").title()}')
        plt.show()
        plt.close()

    def report_drivers(self):
        return self.drivers

    def report_pain_points(self):
        return self.pain_points

    def report_bank_sentiment(self):
        return self.bank_sentiment

    def report_recommendations(self):
        return self.recommendations

    def report_ethics_note(self):
        return ("Review data may be biased due to self-selection (e.g., users with negative experiences are more likely to leave reviews). "
                "Interpret results with caution.")

# Example usage for notebook:
if __name__ == "__main__":
    dbio = DBIO()
    df = dbio.fetch_reviews()
    dbio.close()
    insights = Insights(df)
    print("\nTop Drivers (Positive Keywords):\n", insights.report_drivers())
    print("\nTop Pain Points (Negative Keywords):\n", insights.report_pain_points())
    print("\nSentiment Comparison by Bank:\n", insights.report_bank_sentiment())
    print("\nRecommended Improvements:")
    for rec in insights.report_recommendations():
        print("-", rec)
    print("\nEthics Note:", insights.report_ethics_note())
    # Visualizations (uncomment to generate files)
    # insights.plot_sentiment_by_bank()
    # insights.plot_sentiment_trend()
    # insights.plot_wordcloud('drivers', 'drivers_wordcloud.png')
    # insights.plot_wordcloud('pain_points', 'pain_points_wordcloud.png')
    # insights.plot_rating_distribution()
