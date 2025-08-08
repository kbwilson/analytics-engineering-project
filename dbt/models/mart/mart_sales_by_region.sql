-- models/mart/mart_sales_by_region.sql

with sales as (
    select
        o.order_id,
        o.customer_id,
        o.order_amount
    from {{ ref('stg_orders') }} o
)

select
    c.region,
    sum(s.order_amount) as total_sales,
    count(s.order_id) as total_orders
from sales s
join {{ ref('stg_customers') }} c
    on s.customer_id = c.customer_id
group by c.region
