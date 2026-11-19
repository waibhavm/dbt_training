{% macro create_internal_stages(stage_names) %}
  {%- for stage_name in stage_names -%}
    {% set sql %}
      CREATE OR REPLACE STAGE {{ stage_name }}
    {% endset %}
    {{ log("Creating internal stage: " ~ stage_name, info=True) }}
    {% do run_query(sql) %}
  {%- endfor -%}
  {{ log("All specified internal stages created successfully.", info=True) }}
{% endmacro %}