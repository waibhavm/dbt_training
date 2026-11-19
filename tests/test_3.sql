SELECT
    host_id,
    host_name,
    created_at,
    updated_at
FROM {{ ref('dim_hosts_cleansed') }}
WHERE updated_at < created_at