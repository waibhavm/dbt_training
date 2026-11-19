{% macro no_empty_strings(model_name) %}
    {% set relation = ref(model_name) %}
    {%- for col in adapter.get_columns_in_relation(relation) -%}
        {%- if col.is_string() %}
            {{ col.name }} IS NOT NULL AND {{ col.name }} <> '' AND
        {%- endif %}
    {%- endfor %}
    TRUE
{% endmacro %}