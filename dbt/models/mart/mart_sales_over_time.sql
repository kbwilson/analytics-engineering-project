SELECT
  DATE_TRUNC(o.order_date, MONTH) AS order_month,
  p.category,
  SUM(o.order_amount) AS total_sales,
  COUNT(o.order_id) AS total_orders
FROM {{ ref('stg_orders') }} o
JOIN {{ ref('stg_products') }} p ON o.product_id = p.product_id
GROUP BY order_month, p.category
ORDER BY order_month
