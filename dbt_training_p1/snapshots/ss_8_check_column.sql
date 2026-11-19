{% snapshot ss_8_check_column %}
    {{
        config(
            unique_key='host_id',
            strategy='check',
            check_cols= ['host_name']
        )
    }}
SELECT * FROM {{ ref('dim_hosts_cleansed') }}
{% endsnapshot %}