SELECT
id as listing_id,
listing_url,
name AS listing_name,
room_type,
minimum_nights,
host_id,
price AS price_str,
created_at,
updated_at
FROM {{ source('raw_data_waibhav', 'listings') }}