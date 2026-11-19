{{ 
    config(
    materialized = 'table',
    transient=False,
    tags=['dim']
) }}
SELECT
listing_id,
listing_url,
listing_name,
room_type,
IFF(minimum_nights = 0, 1, minimum_nights) AS minimum_nights,
host_id,
REPLACE(price_str,'$', '')::NUMBER(10, 2) AS price_str,
created_at,
updated_at
FROM {{ ref('src_listings') }}