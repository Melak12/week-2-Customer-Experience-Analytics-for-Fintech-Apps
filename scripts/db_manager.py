"""
db_manager.py
Handles PostgreSQL database connection management for the bank reviews project.
"""
import os
import psycopg2
from psycopg2 import sql
from dotenv import load_dotenv

class DBManager:
    def __init__(self):
        load_dotenv()
        dbname = os.getenv('DB_NAME', 'bank_reviews')
        user = os.getenv('DB_USER', 'postgres')
        password = os.getenv('DB_PASSWORD', 'root')
        host = os.getenv('DB_HOST', 'localhost')
        port = os.getenv('DB_PORT', 5432)
        self.conn_str = f"dbname='{dbname}' user='{user}' password='{password}' host='{host}' port='{port}'"
        self.conn = None

    def connect(self):
        if self.conn is None or self.conn.closed:
            self.conn = psycopg2.connect(self.conn_str)
        return self.conn

    def close(self):
        if self.conn and not self.conn.closed:
            self.conn.close()

    def create_tables(self):
        """
        Create banks and reviews tables if they do not exist (using lowercase names for compatibility).
        """
        create_banks = '''
        CREATE TABLE IF NOT EXISTS banks (
            id SERIAL PRIMARY KEY,
            name VARCHAR(100) UNIQUE NOT NULL,
            info JSONB
        );
        '''
        create_reviews = '''
        CREATE TABLE IF NOT EXISTS reviews (
            id SERIAL PRIMARY KEY,
            bank_id INTEGER REFERENCES banks(id),
            review TEXT,
            date TIMESTAMP,
            source VARCHAR(100),
            processed_review TEXT,
            bert_sentiment VARCHAR(20),
            bert_score FLOAT,
            vader_score FLOAT,
            vader_sentiment VARCHAR(20),
            textblob_score FLOAT,
            textblob_sentiment VARCHAR(20)
        );
        '''
        conn = self.connect()
        with conn.cursor() as cur:
            cur.execute(create_banks)
            cur.execute(create_reviews)
            conn.commit()

if __name__ == "__main__":
    db = DBManager()
    db.create_tables()
    print("Tables created or already exist.")
    db.close()
