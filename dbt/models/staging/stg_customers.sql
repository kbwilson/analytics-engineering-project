-- models/staging/stg_customers.sql

SELECT
  CAST(customer_id AS STRING) AS customer_id,
  name,
  email,
  signup_date,
  region
FROM {{ ref('customers') }}
