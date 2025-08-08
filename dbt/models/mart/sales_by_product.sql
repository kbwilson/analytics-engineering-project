-- models/mart/mart_sales_by_product.sql

with sales as (
    select
        o.product_id,
        sum(o.order_amount) as total_sales,
        count(o.order_id) as total_orders
    from {{ ref('stg_orders') }} o
    group by o.product_id
)
select
    p.product_id,
    p.product_name,
    p.category,
    s.total_sales,
    s.total_orders
from sales s
join {{ ref('stg_products') }} p on s.product_id = p.product_id
