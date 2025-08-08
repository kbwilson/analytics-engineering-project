# Ingestion Layer (Reserved for Future Use)

This folder is reserved for **future data ingestion scripts**, especially for live or external APIs.

### 🧰 Planned Use Cases:
- Python scripts for pulling data from public APIs (e.g., NFL, weather, etc.)
- Integrations with tools like Airbyte or Fivetran
- Local extraction and formatting scripts for batch ingestion

### 📌 Current Status
This repo primarily uses dbt seed files to load synthetic sales data. There are no active ingestion pipelines in use, but this folder provides space for future expansion.

### 🔧 Example:
```bash
python nfl_data_fetch.py
