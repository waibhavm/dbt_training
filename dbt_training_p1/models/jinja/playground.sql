

{{ log("It's Friday Today", info=True) }}
{{ log("It's Friday Today") }}

{% set val = 'Rahul'  %}
{{log("My Name is " ~ val, info=True)}}


select {{ 10+2 }} as Result
select '{{ "rahul" | upper }}' as first_name
select {{ "rahul" | upper }} as first_name
select {{ "RAHUL" | lower }} as first_name
select {{ "RAHUL" | length }} as first_name
select {{ "RAHUL" | replace('A','X') }} as first_name
{% set val = 'Rahul'  %} 
select '{{ dept | default('Ambiguous') }}' as first_name


{% set colour = 'Green' %}
{% if colour == 'Red' %}
    {{ log("Stop", info=True) }}
{% elif colour == 'Orange' %}
    {{ log("Wait", info=True) }}
{% elif colour == 'Green' %}
    {{ log("Go", info=True) }}
{% else %}
    {{ log("Invailed Colour", info=True) }}
{% endif %}


{% set columns = ['LISTING_ID','HOST_NAME','REVIEW_DATE','LISTING_URL','CREATED_AT','ROOM_TYPE'] %}
{% for col in columns %}
    {{ log(col, info=True) }}
{% endfor %}


{% set columns = ['LISTING_ID','HOST_NAME','REVIEW_DATE','LISTING_URL','CREATED_AT','ROOM_TYPE'] %}
{% for col in columns %}
    select '{{col}}' as column_name
    {% if not loop.last %}
        union all
    {% endif %}
{% endfor %}


{% set columns = ['LISTING_ID','HOST_NAME','REVIEW_DATE'] %}
{% set tables = ['src_listing','src_host','src_reviews'] %}
{% for tbl in tables %}
    {% set outer_loop= loop %}
    {% for col in columns %}
        select '{{col}}' as column_name from '{{tbl}}'
        {% if not (loop.last and outer_loop.last) %}
            union all
        {% endif %}
    {% endfor %}  
{% endfor %}

{{ log("-----------------------------------------", info=True) }}

{% set columns = ['LISTING_ID','HOST_NAME','REVIEW_DATE'] %}
{% set tables = ['src_listing','src_host','src_reviews'] %}
{% for tbl in tables %}
    {% set outer_loop= loop %}
    {% for col in columns %}
        {% set inner_loop= loop %}
        SELECT '{{col}}' as column_name from '{{tbl}}'
        {% if not (inner_loop.last and outer_loop.last) %}
            UNION ALL
        {% endif %}
    {% endfor %}  
{% endfor %}




{% set columns = ['LISTING_ID','HOST_NAME','REVIEW_DATE'] %}
{% set tables = ['src_listing','src_host','src_reviews'] %}
{% for tbl in tables %}
        SELECT '{{columns[loop.index0]}}' as column_name from '{{tbl}}'
        {% if not (loop.last) %}
            UNION ALL
        {% endif %}
{% endfor %}