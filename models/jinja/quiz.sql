{% set departments = ['IT', 'HR', 'FINANCE', 'SALES'] %}
{% set columns = ['EMP_ID', 'EMP_NAME', 'DEPARTMENT', 'SALARY'] %}
{% for dept in departments %}
    {{ log('Processing: ' ~ dept, info=True) }}
    SELECT
    {% for col in columns %}
        {{ col }}{% if not loop.last %},{% endif %}
    {% endfor %}
    FROM EMPLOYEE
    {{ 'WHERE' }} DEPARTMENT = '{{ dept }}'
    {% if not loop.last %}
        {{ 'UNION ALL' }}
    {% endif %}
{% endfor %}