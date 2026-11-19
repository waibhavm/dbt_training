WITH cte_1 AS(
    SELECT *
    FROM {{ source('raw_data_waibhav', 'reviews') }}
)
SELECT
listing_id,
date AS review_date,
reviewer_name,
comments AS review_text,
sentiment AS review_sentiment,
test_col
FROM cte_1