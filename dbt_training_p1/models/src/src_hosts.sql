{{ config(
    transient=True,
    tags=['src']
) }}
WITH CTE AS(
SELECT
id AS host_id, 
name AS host_name,
is_superhost,
created_at,
updated_at
FROM {{ source('raw_data_waibhav', 'hosts') }})

SELECT * FROM CTE