with fct_orders as (
    select * from {{ ref('fct_orders') }}
    where order_delivered_customer_date is not null
)

select
    date_trunc(order_purchase_date, month) as month,
    seller_id,
    count(order_id) as total_orders,
    sum(case when is_on_time then 1 else 0 end) as on_time_orders,
    round(
        sum(case when is_on_time then 1 else 0 end) * 100.0 / count(order_id),
        2
    ) as on_time_rate
from fct_orders
left join {{ ref('fct_order_items') }} using (order_id)
group by 1, 2