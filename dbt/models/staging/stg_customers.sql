-- models/staging/stg_customers.sql

SELECT
  CAST(customer_id AS STRING) AS customer_id,
  customer_name,
  customer_email,
  customer_segment
FROM {{ ref('customers') }}
