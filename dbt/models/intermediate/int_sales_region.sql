with orders as (
    select * from {{ ref('stg_orders') }}
),
customers as (
    select * from {{ ref('stg_customers') }}
),
region as (
    select * from {{ ref('stg_region') }}
)
select
    r.region_name,
    sum(o.order_amount) as total_sales,
    count(o.order_id) as total_orders
from orders o
join customers c on o.customer_id = c.customer_id
join region r on c.region_id = r.region_id
group by r.region_name
