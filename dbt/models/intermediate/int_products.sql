with order_items as (
    select * from {{ ref('stg_order_items') }}
),
orders as (
    select * from {{ ref('stg_orders') }}
),
products as (
    select * from {{ ref('stg_products') }}
)
select
    p.product_id,
    p.product_name,
    sum(oi.quantity) as total_quantity_sold,
    sum(oi.quantity * oi.unit_price) as total_revenue
from order_items oi
join products p on oi.product_id = p.product_id
join orders o on oi.order_id = o.order_id
group by p.product_id, p.product_name
