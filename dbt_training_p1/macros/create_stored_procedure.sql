{% macro create_stored_procedure(procedure_name, return_type, arguments="", procedure_body="") %}
  {% set sql %}
    CREATE OR REPLACE PROCEDURE {{ procedure_name }}({{ arguments }})
    RETURNS {{ return_type }}
    LANGUAGE SQL
    AS
    $$
    BEGIN
      {{ procedure_body }}
    END;
    $$;
  {% endset %}
  {{ log("Creating stored procedure: " ~ procedure_name, info=True) }}
  {% do run_query(sql) %}
  {{ log("Stored procedure created successfully.", info=True) }}
{% endmacro %}