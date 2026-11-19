{% test min_row_count(model, value_count) %}
    SELECT count(1)
    FROM {{ model }}
    HAVING COUNT(*) < {{ value_count }}
{% endtest %}