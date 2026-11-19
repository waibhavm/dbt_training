{{ 
    config(
    materialized='table',
    transient=False,
    tags=['dim'],
    enabled=true
) }}

SELECT
host_id, 
nvl(host_name, 'Unknown') AS host_name,
is_superhost,
created_at,
updated_at
FROM {{ ref('src_hosts') }}