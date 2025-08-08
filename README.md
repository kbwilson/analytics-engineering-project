# Analytics Engineering Project

This project demonstrates a modern analytics pipeline focused on **sales performance analysis** using synthetic data. It showcases data ingestion, transformation, and visualization using tools like **dbt**, **BigQuery**, and **Looker Studio**.

---

## 🚀 Project Overview

The primary goal of this project is to simulate a real-world analytics workflow, from raw data to business-ready dashboards. It includes:

- Seeded data from [Mockaroo](https://mockaroo.com/) representing orders, customers, and products.
- A modular dbt pipeline with staging, mart, and test layers.
- Four interactive dashboards built in Looker Studio.
- Optional scaffolding for future additions (e.g., NFL API ingestion).

---

## 🧱 Tech Stack

| Layer        | Tool               | Purpose                             |
|--------------|--------------------|-------------------------------------|
| Transformation | dbt              | Modular, testable SQL models        |
| Storage      | BigQuery           | Cloud data warehouse                 |
| Visualization| Looker Studio      | BI dashboards and insights          |
| Orchestration| Airflow (optional) | Future orchestration layer          |

---

## 📁 Project Structure

```
analytics-engineering-project/
├── dashboards/ # Links to final dashboards (see below)
├── data/ # Placeholder for any additional test data
├── dbt/
│ ├── dbt_project.yml # DBT config
│ ├── models/ # Staging and mart models
│ ├── seeds/ # Mockaroo seed files
│ ├── snapshots/ # Placeholder for future snapshots
│ ├── tests/ # Schema tests
│ └── macros/ # Placeholder for custom macros
├── ingestion/ # Placeholder for future ingestion scripts
├── orchestration/ # Placeholder for future DAGs (Airflow)
├── models/nfl_models/ # Optional future addition
├── requirements.txt
└── README.md
```


---

## 📊 Dashboards

All dashboards are interactive and built with Looker Studio:

- 📍 [Sales by Region](https://lookerstudio.google.com/s/smFV5AAQiu0)
- 🛍️ [Top Products](https://lookerstudio.google.com/s/ppd2UBm7Rus)
- 👤 [Customer Lifetime Value](https://lookerstudio.google.com/s/hA7EA8bp_UQ)
- 📈 [Revenue Trends](https://lookerstudio.google.com/s/r7AqNyIFVGw)

---

## 🧪 dbt Features

- **Layered architecture:** `staging → marts`
- **Clean type casting and transformations**
- **Built-in tests:** `unique`, `not_null`, `accepted_values`
- **Ready for documentation** via `dbt docs`
- **Supports exposures for BI visibility (optional)**
- **BigQuery** as a performant backend

---

## 🧠 How to Use This Repo

1. Clone this repo and connect to a BigQuery project.
2. Seed your database with the sample data in `/seeds`.
3. Run dbt:
   ```bash
   dbt seed
   dbt run
   dbt test
4. Explore the Looker dashboards via the links above.

---

## 🧱 Future Enhancements
The repo contains scaffolding for:

NFL data ingestion via Python script (players_flattened.sql and ingestion folders)

Airflow DAGs for orchestration

dbt exposures and documentation site

Snapshots for slowly changing dimensions

---

📜 License
MIT License

