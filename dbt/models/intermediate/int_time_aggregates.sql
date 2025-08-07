with orders as (
    select * from {{ ref('stg_orders') }}
)
select
    date_trunc('day', order_date) as day,
    sum(order_amount) as daily_sales,
    count(order_id) as daily_orders
from orders
group by day
order by day
