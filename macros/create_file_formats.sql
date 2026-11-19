{% macro create_file_formats(formats_dict) %}
  {%- for format_name, format_config in formats_dict.items() -%}
    {% set sql %}
      CREATE OR REPLACE FILE FORMAT {{ format_name }}
      TYPE = {{ format_config.type }}
      {% if format_config.options is defined %}
        {{ format_config.options }}
      {% endif %}
    {% endset %}
    {{ log("Creating file format: " ~ format_name, info=True) }}
    {% do run_query(sql) %}
  {%- endfor -%}
  {{ log("All specified file formats created successfully.", info=True) }}
{% endmacro %}