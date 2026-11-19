{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'merge',
    unique_key = 'listing_id',
    on_schema_change = 'ignore'
    )
}}

WITH cte AS(
    SELECT *
    FROM {{ ref('src_reviews') }}
    WHERE REVIEW_TEXT IS NOT NULL
)
SELECT *
FROM cte

{% if is_incremental() %}
WHERE review_date > (SELECT MAX(review_date) FROM {{ this }})   
{% endif %}