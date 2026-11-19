{% snapshot ss_1_timestamp %}
    {{
        config(
            unique_key='host_id',
            strategy='timestamp',
            updated_at='created_at'
        )
    }}
SELECT * FROM {{ ref('dim_hosts_cleansed') }}
{% endsnapshot %}