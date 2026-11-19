{% snapshot ss_3_timestamp_hard_delete_new_record %}
    {{
        config(
            unique_key='host_id',
            strategy='timestamp',
            updated_at='created_at',
            hard_deletes='new_record'
        )
    }}
SELECT * FROM {{ ref('dim_hosts_cleansed') }}
{% endsnapshot %}