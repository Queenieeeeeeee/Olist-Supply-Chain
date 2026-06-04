with orders as (
    select * from {{ ref('fct_orders') }}
    where order_delivered_customer_date is not null
),

items as (
    select * from {{ ref('fct_order_items') }}
)

select
    items.seller_id,
    items.seller_state,
    count(distinct orders.order_id) as total_orders,
    round(
        sum(case when orders.is_on_time then 1 else 0 end) * 100.0 / count(distinct orders.order_id),
        2
    ) as on_time_rate,
    round(avg(orders.cycle_time_days), 2) as avg_cycle_time_days,
    round(sum(items.total_item_value), 2) as total_revenue
from orders
left join items on orders.order_id = items.order_id
group by 1, 2