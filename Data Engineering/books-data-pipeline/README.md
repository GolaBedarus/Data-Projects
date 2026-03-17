# 📚 Books Data Pipeline (Airflow + Docker)

End-to-end ETL pipeline that extracts book data from a website, transforms it, and loads it into PostgreSQL. Fully orchestrated with Apache Airflow and containerized using Docker.

---

## 🚀 Architecture

```text
Scraping → Transform → Load → PostgreSQL
              ↑
          Airflow DAG
              ↑
           Docker

🧱 Tech Stack

🐍 Python 3.12

🌬️ Apache Airflow 3

🐳 Docker & Docker Compose

🐘 PostgreSQL

📦 Pandas

🌐 Requests / BeautifulSoup

⚙️ Features

Web scraping data extraction

Data transformation and cleaning

Data loading into PostgreSQL

Workflow orchestration with Airflow

Manual and scheduled execution

Fully reproducible environment with Docker

📂 Project Structure

.
├── airflow/
│   ├── dags/
│   │   └── books_etl_dag.py
│   ├── logs/
│   └── plugins/
├── database/
│   ├── schema.sql
│   └── init_airflow.sql
├── src/
│   ├── scraping/
│   ├── transform/
│   └── load/
├── docker-compose.yml
├── Dockerfile.airflow
├── requirements.txt
└── README.md


▶️ Getting Started
1. Clone the repository

git clone https://github.com/your-username/books-data-pipeline.git
cd books-data-pipeline

2. Start the environment

docker compose up --build

3. Access Airflow UI

👉 http://localhost:8080

Enable the DAG: books_etl_pipeline

Trigger a manual run

📊 DAG Overview

The pipeline consists of 3 main tasks:

scrape_books

transform_books

load_books_to_postgres

Dependencies:

scrape_books → transform_books → load_books_to_postgres

🧪 Database Configuration

Host: localhost

Port: 5433

Database: booksdb

User: postgres

Password: postgres

🐛 Challenges Solved

During development, several real-world Airflow issues were addressed:

❌ Service connection issues (Connection refused)

❌ Task state mismatch errors

❌ Execution API failures (403 Forbidden)

❌ JWT authentication errors (Signature verification failed)

✔️ Solution: Proper configuration of AIRFLOW__API_AUTH__JWT_SECRET

📈 Future Improvements

Store data in Parquet (Data Lake layer)

Add retries and alerting in Airflow

Integrate dbt for transformations

Add dashboards (Metabase / Superset)

Deploy to AWS or GCP

🧑‍💻 Author

Galo Badaro

GitHub: https://github.com/GolaBedarus

LinkedIn: www.linkedin.com/in/galo-badaró


