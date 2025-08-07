-- models/intermediate/int_products.sql

with orders as (
    select * from {{ ref('stg_orders') }}
),
products as (
    select * from {{ ref('stg_products') }}
)
select
    p.product_id,
    p.product_name,
    sum(o.quantity) as total_quantity_sold,
    sum(o.quantity * p.price) as total_revenue
from orders o
join products p on o.product_id = p.product_id
group by p.product_id, p.product_name
