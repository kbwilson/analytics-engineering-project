-- models/mart/mart_inventory_summary.sql

with inventory as (
    select
        p.product_id,
        p.product_name,
        p.initial_inventory,
        sum(o.quantity) as total_sales
    from {{ ref('stg_products') }} p
    left join {{ ref('stg_orders') }} o on p.product_id = o.product_id
    group by p.product_id, p.product_name, p.initial_inventory
)
select
    product_id,
    product_name,
    initial_inventory - coalesce(total_sales, 0) as remaining_inventory
from inventory
