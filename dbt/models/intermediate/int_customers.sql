with orders as (
    select * from {{ ref('stg_orders') }}
),
customers as (
    select * from {{ ref('stg_customers') }}
)
select
    c.customer_id,
    c.customer_name,
    count(o.order_id) as total_orders,
    sum(o.order_amount) as total_spent,
    max(o.order_date) as last_order_date
from orders o
join customers c on o.customer_id = c.customer_id
group by c.customer_id, c.customer_name
