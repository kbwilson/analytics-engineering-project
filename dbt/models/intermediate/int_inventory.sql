with sales as (
    select 
        oi.product_id,
        sum(oi.quantity) as total_sales
    from {{ ref('stg_order_items') }} oi
    group by oi.product_id
),
inventory as (
    select 
        p.product_id,
        p.initial_inventory,
        s.total_sales
    from {{ ref('stg_inventory') }} p
    left join sales s on p.product_id = s.product_id
)
select
    product_id,
    initial_inventory - coalesce(total_sales, 0) as remaining_inventory
from inventory
