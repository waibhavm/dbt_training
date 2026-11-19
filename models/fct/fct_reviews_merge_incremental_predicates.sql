{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'merge',
    unique_key = 'listing_id',
    incremental_predicates = [ "DBT_INTERNAL_DEST.review_date >= dateadd('day', -30, current_date())" ]
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