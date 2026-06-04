with orders as (
    select * from {{ ref('stg_raw__olist_orders') }}
),

payments as (
    select
        order_id,
        sum(payment_value) as total_payment_value
    from {{ ref('stg_raw__olist_order_payments') }}
    group by order_id
),

customers as (
    select * from {{ ref('dim_customers') }}
)

select
    orders.order_id,
    orders.customer_id,
    orders.order_status,
    orders.order_purchase_date,
    orders.order_estimated_delivery_date,
    orders.order_delivered_customer_date,
    customers.customer_state,
    payments.total_payment_value,
    date_diff(
        orders.order_delivered_customer_date,
        orders.order_purchase_date,
        day
    ) as cycle_time_days,
    case
        when orders.order_delivered_customer_date <= orders.order_estimated_delivery_date
        then true
        else false
    end as is_on_time
from orders
left join payments on orders.order_id = payments.order_id
left join customers on orders.customer_id = customers.customer_id