with order_items as (
    select * from {{ ref('stg_raw__olist_order_items') }}
),

products as (
    select * from {{ ref('dim_products') }}
),

sellers as (
    select * from {{ ref('dim_sellers') }}
)

select
    order_items.order_id,
    order_items.order_item_id,
    order_items.product_id,
    order_items.seller_id,
    order_items.price,
    order_items.freight_value,
    order_items.price + order_items.freight_value as total_item_value,
    products.product_category_name,
    sellers.seller_state
from order_items
left join products on order_items.product_id = products.product_id
left join sellers on order_items.seller_id = sellers.seller_id