{% snapshot ss_7_check_compare %}
    {{
        config(
            unique_key='host_id',
            strategy='check',
            check_cols='all'
        )
    }}
SELECT * FROM {{ ref('dim_hosts_cleansed') }}
{% endsnapshot %}