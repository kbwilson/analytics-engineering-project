-- models/mart/mart_sales_by_customer.sql

with sales as (
    select
        o.customer_id,
        sum(o.order_amount) as total_sales,
        count(o.order_id) as total_orders
    from {{ ref('stg_orders') }} o
    group by o.customer_id
)
select
    c.customer_id,
    c.name as customer_name,
    c.region,
    s.total_sales,
    s.total_orders
from sales s
join {{ ref('stg_customers') }} c on s.customer_id = c.customer_id
