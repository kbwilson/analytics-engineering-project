-- stg_customers has a column named `name`, not `customer_name`.
-- Alias it to `customer_name` for clarity downstream.

WITH orders AS (
  SELECT *
  FROM {{ ref('stg_orders') }}
),
customers AS (
  SELECT *
  FROM {{ ref('stg_customers') }}
)
SELECT
  c.customer_id,
  c.name AS customer_name,
  COUNT(o.order_id) AS total_orders,
  SUM(o.order_amount) AS total_spent,
  MAX(o.order_date) AS last_order_date
FROM customers c
LEFT JOIN orders o
  ON o.customer_id = c.customer_id
GROUP BY
  c.customer_id,
  c.name;
