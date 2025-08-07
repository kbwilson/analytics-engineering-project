with orders as (
    select * from {{ ref('stg_orders') }}
),
order_items as (
    select * from {{ ref('stg_order_items') }}
)
select
    o.order_status,
    count(o.order_id) as total_orders,
    avg(o.order_amount) as avg_order_value,
    sum(o.order_amount) as total_order_value
from orders o
join order_items oi on o.order_id = oi.order_id
group by o.order_status
