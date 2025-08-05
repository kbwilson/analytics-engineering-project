# analytics-engineering-project

# Analytics Engineering Project

This project demonstrates a complete modern data stack pipeline — from ingestion to transformation to visualization — using real-world and synthetic datasets. Built with tools like **Airbyte**, **dbt**, **BigQuery**, and **Looker Studio**, it reflects the responsibilities of a modern analytics engineer and showcases modular, testable, and scalable data workflows.

## 🚀 Project Overview

This end-to-end project simulates a real analytics environment by integrating:
- Synthetic business datasets from **Mockaroo**
- Public datasets from **Kaggle**
- Live data from the **NFL training camp period**, ingested via custom Python scripts

All data flows through an ingestion and transformation pipeline to power automated dashboards and business intelligence tools.

## 🧱 Tech Stack

| Layer        | Tool               | Purpose                             |
|--------------|--------------------|-------------------------------------|
| Ingestion    | Airbyte, Python    | Load data from APIs and CSV files   |
| Transformation | dbt              | Build modular, tested data models   |
| Storage      | BigQuery           | Cloud data warehouse                 |
| Orchestration| Airflow (optional) | Schedule and monitor pipelines      |
| Visualization| Looker Studio      | BI dashboards and insights          |

## 📁 Project Structure
'''
analytics-engineering-project/
├── README.md
├── data/ # Sample data files only
│ ├── mockaroo_sample.csv
│ ├── kaggle_sample.csv
│ └── nfl_sample.csv
├── ingestion/
│ └── nfl_data_fetch.py # Python script to fetch NFL data
├── orchestration/
│ └── airflow_dag.py # (Optional) Example DAG
├── dashboards/
│ └── looker_studio_link.txt # Link to final dashboards
├── dbt/
│ ├── dbt_project.yml
│ ├── packages.yml
│ ├── models/
│ │ ├── staging/
│ │ ├── intermediate/
│ │ └── marts/
│ ├── tests/
│ └── snapshots/
'''

## 📊 Data Sources

| Source      | Description                                       |
|-------------|---------------------------------------------------|
| **Mockaroo**| Synthetic sales and customer data                 |
| **Kaggle**  | Enriched public datasets (e.g., product analytics)|
| **NFL API** | Real-time training camp data and roster changes   |

> **Note**: Only sample rows are included in `/data/` for demonstration. Full data ingestion is performed via scripts or connectors.

## 🧪 dbt Features

- Modular models using `ref()` and CTEs
- Incremental models for scalable processing
- Automated testing (`unique`, `not_null`, `accepted_values`)
- Layered structure: **staging → intermediate → marts**
- Built-in documentation and exposures via dbt Cloud

## 📈 Dashboards

Interactive dashboards created using **Looker Studio** with views like:
- NFL player transactions & team activity
- Sales and customer funnel (Mockaroo)
- Cross-dataset insights

🔗 [View Dashboard](#) *(Update with your public Looker Studio link)*

## 🧠 How to Use This Repo

1. Clone this repo and install requirements (if using Airflow or Python scripts).
2. Load sample datasets or run the ingestion script.
3. Run dbt models locally or in dbt Cloud.
4. Explore dashboards via Looker Studio.

## 🛠️ Setup Notes

- Requires access to a Google Cloud Project with BigQuery enabled
- dbt CLI or dbt Cloud account
- Python 3.9+ if running ingestion scripts manually

## 📜 License

This project is open source and available under the MIT License.

---

