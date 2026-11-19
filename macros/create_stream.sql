{% macro create_stream(stream_name, target_model, append_only=false) %}
  {% set sql %}
    CREATE OR REPLACE STREAM {{ stream_name }} 
    ON TABLE {{ ref(target_model) }}
    {% if append_only %}
      APPEND_ONLY = TRUE
    {% endif %};
  {% endset %}
  {{ log("Creating stream: " ~ stream_name, info=True) }}
  {% do run_query(sql) %}
  {{ log("Stream created successfully.", info=True) }}
{% endmacro %}