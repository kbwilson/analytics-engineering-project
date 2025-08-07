with customer_activity as (
    select 
        c.customer_id,
        sum(o.order_amount) as total_spent,
        count(o.order_id) as total_orders,
        max(o.order_date) as last_order_date
    from {{ ref('stg_orders') }} o
    join {{ ref('stg_customers') }} c on o.customer_id = c.customer_id
    group by c.customer_id
)
select
    customer_id,
    case
        when total_spent > 1000 then 'High Value'
        when total_orders > 10 then 'Frequent'
        else 'One-Time'
    end as customer_segment
from customer_activity
