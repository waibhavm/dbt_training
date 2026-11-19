{% macro positive_values(model, column_name) %} 
    {% set query %}
    select * from {{ model }} where {{ column_name }} > 0    
    {% endset %}

{{ log("Executing Query:" ~ query, info= true) }}
{% set results = run_query(query) %}

{% if execute %}
    {{ log("rowcount:" ~ results | length, info=true) }}
{% endif %}

{% endmacro %}



