-- models/staging/stg_products.sql

SELECT
  CAST(product_id AS STRING) AS product_id,
  product_name,
  category,
  price
FROM {{ ref('products') }}
