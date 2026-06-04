with sellers as (
    select * from {{ ref('stg_raw__olist_sellers') }}
)

select
    seller_id,
    seller_city,
    seller_state
from sellers