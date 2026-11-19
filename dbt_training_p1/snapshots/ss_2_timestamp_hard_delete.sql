{% snapshot ss_2_timestamp_hard_delete %}
    {{
        config(
            unique_key='host_id',
            strategy='timestamp',
            updated_at='created_at',
            hard_deletes='invalidate'
        )
    }}
SELECT * FROM {{ ref('dim_hosts_cleansed') }}
{% endsnapshot %}