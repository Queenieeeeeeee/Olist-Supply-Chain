with fct_orders as (
    select * from {{ ref('fct_orders') }}
    where cycle_time_days is not null
)

select
    date_trunc(order_purchase_date, month) as month,
    product_category_name,
    count(fct_orders.order_id) as total_orders,
    round(avg(cycle_time_days), 2) as avg_cycle_time_days,
    min(cycle_time_days) as min_cycle_time_days,
    max(cycle_time_days) as max_cycle_time_days
from fct_orders
left join {{ ref('fct_order_items') }} using (order_id)
group by 1, 2