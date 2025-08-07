-- models/staging/stg_orders.sql

SELECT
  CAST(order_id AS STRING) AS order_id,
  CAST(customer_id AS STRING) AS customer_id,
  CAST(product_id AS STRING) AS product_id,
  CAST(order_date AS DATE) AS order_date,
  SAFE_CAST(order_amount AS FLOAT64) AS order_amount
FROM {{ ref('orders') }}
