{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {
      "field": "review_date",
      "data_type": "date"
    },
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