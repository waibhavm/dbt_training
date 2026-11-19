WITH CTE AS
(SELECT * FROM {{ ref('src_listings') }}
WHERE minimum_nights < {{ var('friday_val') }}
)