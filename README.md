# Week 2 - Customer Experience Analytics for Fintech Apps
This week’s challenge centers on analyzing customer satisfaction with mobile banking apps by collecting and processing user reviews from the Google Play Store for three Ethiopian banks:

- Commercial Bank of Ethiopia (CBE)
- Bank of Abyssinia (BOA)
- Dashen Bank

### Business Objective
Omega Consultancy is supporting banks to improve their mobile apps to enhance customer retention and satisfaction. Your role as a Data Analyst is to:

- Scrape user reviews from the Google Play Store.
- Analyze sentiment (positive/negative/neutral) and extract themes (e.g., "bugs", "UI").
- Identify satisfaction drivers (e.g., speed) and pain points (e.g., crashes).
- Store cleaned review data in a PostgreSQL database.
- Deliver a report with visualizations and actionable recommendations.

## Setup
1. Clone: `git clone https://github.com/Melak12/week-2-Customer-Experience-Analytics-for-Fintech-Apps.git`
2. Create venv: `python3 -m venv .venv`
3. Activate: `source .venv/bin/activate` (macOS/Linux) or `.venv\Scripts\activate` (Windows)
4. Install: `pip install -r requirements.txt`

Note: if requirements.txt is missing, you might need to run this command
`pip freeze > requirements.txt`

---

## Project Structure

- **notebooks/**: Contains Jupyter notebooks for exploratory data analysis (EDA) and reporting for each bank and the overall app review data. Use these notebooks to interactively explore, visualize, and document findings.
- **scripts/**: Contains all Python scripts for scraping, preprocessing, sentiment analysis, database management, and utility functions. Key scripts include:
  - `app_review_scrapper.py`: Scrapes and preprocesses Google Play reviews.
  - `sentiment_analysis.py`: Performs sentiment analysis and keyword/theme extraction.
  - `db_manager.py`: Handles PostgreSQL connection and table creation.
  - `db_io.py`: Handles saving, fetching, and clearing data in the database.
  - `utils.py`: Shared utility functions and enums.
- **sql/**: Contains SQL scripts for database setup and schema management. For example, `reviews_db.sql` can be used to manually create or inspect the database schema if needed.
- **Data/**: Stores all raw, cleaned, and gold-standard review CSVs. Subfolders include:
  - `cleaned/`: Cleaned review data.
  - `gold/`: Processed data with sentiment columns.

---

## Environment Variables

Database credentials and other sensitive settings should be stored in a `.env` file at the project root. An example template is provided as `.env.example`:

```
DB_NAME=bank_reviews
DB_USER=postgres
DB_PASSWORD=yourpassword
DB_HOST=localhost
DB_PORT=5432
```

Copy `.env.example` to `.env` and update the values as needed for your local environment.

---

## Database Integration

See `scripts/README.md` for full details on database setup, table creation, and usage. In summary:
- Use `db_manager.py` to create the required tables (`banks`, `reviews`).
- Use `db_io.py` to save, fetch, and clear review and bank data.
- All database credentials are loaded from the `.env` file.

---

## Additional Notes
- All scripts and notebooks are modular and reusable.
- Table and column names are lowercase for PostgreSQL compatibility.
- The database must be running locally and accessible with the credentials in your `.env` file.
- For more details on each module, see the respective script or notebook documentation.