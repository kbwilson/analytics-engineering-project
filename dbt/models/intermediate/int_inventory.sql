-- models/intermediate/int_inventory.sql

with sales as (
    select 
        o.product_id,
        sum(o.quantity) as total_sales
    from {{ ref('stg_orders') }} o
    group by o.product_id
),
inventory as (
    select 
        p.product_id,
        p.initial_inventory,
        s.total_sales
    from {{ ref('stg_products') }} p
    left join sales s on p.product_id = s.product_id
)
select
    product_id,
    initial_inventory - coalesce(total_sales, 0) as remaining_inventory
from inventory
