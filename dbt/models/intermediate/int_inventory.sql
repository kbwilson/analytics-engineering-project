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
        sum(o.quantity) as total_sales
    from {{ ref('stg_products') }} p
    left join {{ ref('stg_orders') }} o on p.product_id = o.product_id
    group by p.product_id
)
select
    product_id,
    -- We skip initial_inventory and just calculate total sales
    coalesce(total_sales, 0) as remaining_inventory
from inventory
