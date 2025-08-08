-- models/mart/mart_inventory_summary.sql

with inventory as (
    select
        p.product_id,
        p.product_name,
        sum(o.quantity) as total_sales
    from {{ ref('stg_products') }} p
    left join {{ ref('stg_orders') }} o on p.product_id = o.product_id
    group by p.product_id, p.product_name
)
select
    product_id,
    product_name,
    -- Assuming initial_inventory is not available, we calculate remaining_inventory based on total_sales
    coalesce(total_sales, 0) as remaining_inventory
from inventory
