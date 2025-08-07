-- models/intermediate/int_sales_region.sql

with orders as (
    select * from {{ ref('stg_orders') }}
),
customers as (
    select * from {{ ref('stg_customers') }}
)
select
    c.region as region_name,
    sum(o.order_amount) as total_sales,
    count(o.order_id) as total_orders
from orders o
join customers c on o.customer_id = c.customer_id
group by c.region
