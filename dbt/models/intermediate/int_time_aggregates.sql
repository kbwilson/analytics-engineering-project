-- BigQuery: DATE_TRUNC takes (date_expr, date_part) with an unquoted date part
-- Also avoid aliasing to the bare word "day" just in case; use day_date.

WITH orders AS (
  SELECT *
  FROM {{ ref('stg_orders') }}
)
SELECT
  DATE_TRUNC(order_date, DAY) AS day_date,
  SUM(order_amount) AS daily_sales,
  COUNT(order_id) AS daily_orders
FROM orders
GROUP BY day_date
ORDER BY day_date;
