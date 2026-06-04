with source as (
    select * from {{ source('raw', 'olist_orders') }}
),

renamed as (
    select
        order_id,
        customer_id,
        order_status,
        cast(order_purchase_timestamp as date) as order_purchase_date,
        cast(order_approved_at as date) as order_approved_date,
        cast(order_delivered_carrier_date as date) as order_delivered_carrier_date,
        cast(order_delivered_customer_date as date) as order_delivered_customer_date,
        cast(order_estimated_delivery_date as date) as order_estimated_delivery_date
    from source
)

select * from renamed