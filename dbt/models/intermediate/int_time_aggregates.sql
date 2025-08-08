WITH orders AS (
  SELECT *
  FROM {{ ref('stg_orders') }}
)
SELECT
  order_date AS day_date,
  SUM(order_amount) AS daily_sales,
  COUNT(order_id) AS daily_orders
FROM orders
GROUP BY day_date
ORDER BY day_date
