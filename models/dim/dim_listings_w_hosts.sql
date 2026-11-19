{{ 
    config(
    materialized = 'table',
    transient=False,
    tags=['dim']
) }}

WITH CTE1 AS (
    SELECT *
    FROM {{ ref('dim_listings_cleansed') }}
),
CTE2 AS (
    SELECT *
    FROM {{ ref('dim_hosts_cleansed') }}
)

SELECT 
    {{ dbt_utils.generate_surrogate_key(['CTE1.listing_id', 'CTE1.listing_url']) }} as listing_sk,
    CTE1.listing_id,
    CTE1.listing_url,
    CTE1.listing_name,
    CTE1.room_type,
    CTE1.minimum_nights,
    CTE1.host_id,
    CTE1.price_str,
    CTE2.host_name,
    CTE2.is_superhost,
    CTE1.created_at AS created_at,
    GREATEST(CTE1.updated_at, CTE2.updated_at) AS updated_at
FROM CTE1
LEFT JOIN CTE2 ON CTE1.host_id = CTE2.host_id