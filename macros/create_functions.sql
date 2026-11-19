{% macro create_functions(functions_list) %}
  {%- for func in functions_list -%}
    {% set sql %}
      CREATE OR REPLACE FUNCTION {{ func.name }}({{ func.arguments }})
      RETURNS {{ func.return_type }}
      LANGUAGE SQL
      AS
      $$
        {{ func.body }}
      $$;
    {% endset %}
    {{ log("Creating function: " ~ func.name, info=True) }}
    {% do run_query(sql) %}
  {%- endfor -%}
  {{ log("All specified functions created successfully.", info=True) }}
{% endmacro %}