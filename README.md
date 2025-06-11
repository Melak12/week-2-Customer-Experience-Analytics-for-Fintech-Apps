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

The repository is organized as follows:

```
week-2-Customer-Experience-Analytics-for-Fintech-Apps/
│
├── README.md                # Project overview and setup instructions
├── requirements.txt         # Python dependencies
│
├── Data/                    # (Created at runtime) Raw, cleaned, and gold-standard review CSVs
│   ├── boa_reviews.csv
│   ├── cbe_reviews.csv
│   ├── dashen_reviews.csv
│   ├── cleaned/             # Cleaned review data
│   └── gold/                # Processed data with sentiment columns
│
├── notebooks/               # Jupyter notebooks for EDA and reporting
│   ├── app_review_eda.ipynb
│   ├── boa_eda.ipynb
│   ├── cbe_eda.ipynb
│   ├── dashen_eda.ipynb
│   ├── insights_and_recommendations.ipynb
│   └── README.md            # Documentation for notebooks
│
├── scripts/                 # Python scripts for scraping, analysis, and database
│   ├── app_review_scrapper.py
│   ├── sentiment_analysis.py
│   ├── db_manager.py
│   ├── db_io.py
│   ├── insights.py
│   ├── utils.py
│   └── README.md            # Documentation for scripts
│
├── sql/                     # SQL scripts for database setup
│   └── reviews_db.sql
│
└── tests/                   # Unit tests (if any)
```

- The `Data/` directory is created at runtime and will contain all raw, cleaned, and processed review data.
- Notebooks and scripts are modular and reusable for different banks and analysis tasks.
- See each subdirectory's README for more details on usage and workflow.

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