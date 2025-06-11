"""
db_io.py
Handles saving and fetching data from the PostgreSQL database for the bank reviews project.
"""
import pandas as pd
import json
import os
from dotenv import load_dotenv
from scripts.db_manager import DBManager

class DBIO:
    def __init__(self):
        load_dotenv()
        self.db = DBManager()
        self.conn = self.db.connect()

    def save_bank(self, name, info=None):
        """Insert a bank if not exists. Returns bank id."""
        with self.conn.cursor() as cur:
            cur.execute("SELECT id FROM banks WHERE name=%s", (name,))
            result = cur.fetchone()
            if result:
                return result[0]
            cur.execute(
                "INSERT INTO banks (name, info) VALUES (%s, %s) RETURNING id",
                (name, json.dumps(info) if info else None)
            )
            bank_id = cur.fetchone()[0]
            self.conn.commit()
            return bank_id

    def save_reviews(self, bank_name, reviews_df: pd.DataFrame):
        """Save processed reviews DataFrame to the reviews table."""
        bank_id = self.save_bank(bank_name)
        with self.conn.cursor() as cur:
            for _, row in reviews_df.iterrows():
                cur.execute(
                    """
                    INSERT INTO reviews (bank_id, review, date, source, processed_review, bert_sentiment, bert_score, vader_score, vader_sentiment, textblob_score, textblob_sentiment)
                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
                    """,
                    (
                        bank_id,
                        row.get('review'),
                        row.get('date'),
                        row.get('source'),
                        row.get('processed_review'),
                        row.get('bert_sentiment'),
                        float(row.get('bert_score')) if row.get('bert_score') is not None and row.get('bert_score') != '' else None,
                        float(row.get('vader_score')) if row.get('vader_score') is not None and row.get('vader_score') != '' else None,
                        row.get('vader_sentiment'),
                        float(row.get('textblob_score')) if row.get('textblob_score') is not None and row.get('textblob_score') != '' else None,
                        row.get('textblob_sentiment')
                    )
                )
            self.conn.commit()

    def fetch_reviews(self, bank_name=None):
        """Fetch reviews for a given bank or all banks as a DataFrame."""
        query = """
        SELECT b.name as bank, r.* FROM reviews r
        JOIN banks b ON r.bank_id = b.id
        """
        params = ()
        if bank_name:
            query += " WHERE b.name = %s"
            params = (bank_name,)
        df = pd.read_sql(query, self.conn, params=params)
        return df

    def clear_reviews_for_bank(self, bank_name):
        """Delete all reviews for a specific bank by name."""
        with self.conn.cursor() as cur:
            cur.execute("SELECT id FROM banks WHERE name=%s", (bank_name,))
            result = cur.fetchone()
            if result:
                bank_id = result[0]
                cur.execute("DELETE FROM reviews WHERE bank_id=%s", (bank_id,))
                self.conn.commit()

    def close(self):
        self.db.close()

if __name__ == "__main__":
    dbio = DBIO()
    print("Banks in DB:")
    print(dbio.fetch_reviews().head())
    dbio.close()
