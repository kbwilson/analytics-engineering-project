-- models/intermediate/int_order_summary.sql

with orders as (
    select * from {{ ref('stg_orders') }}
),
customers as (
    select * from {{ ref('stg_customers') }}
),
products as (
    select * from {{ ref('stg_products') }}
)

select
    o.order_id,
    o.order_date,
    o.quantity,
    o.order_amount,
    c.customer_id,
    c.name as customer_name,
    c.email as customer_email,
    c.region as customer_region,
    p.product_id,
    p.product_name,
    p.category as product_category,
    p.price as product_price,
    o.quantity * p.price as total_product_value
from orders o
join customers c on o.customer_id = c.customer_id
join products p on o.product_id = p.product_id

