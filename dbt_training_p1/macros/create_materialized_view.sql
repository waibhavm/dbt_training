{% macro create_materialized_view(view_name, source_model) %}
  {% set sql %}
    CREATE OR REPLACE MATERIALIZED VIEW {{ view_name }} AS
    SELECT * FROM {{ ref(source_model) }};
  {% endset %}
  {{ log("Creating materialized view: " ~ view_name, info=True) }}
  {% do run_query(sql) %}
  {{ log("Materialized view created successfully.", info=True) }}
{% endmacro %}