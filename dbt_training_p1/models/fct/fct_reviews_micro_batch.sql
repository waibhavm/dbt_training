{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'microbatch',
    event_time = 'review_date',
    batch_size = 'year',
    begin = '2012-07-08',
    enabled = False
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