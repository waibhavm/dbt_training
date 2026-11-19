{% snapshot ss_4_timestamp_hard_delete_open_end_dates %}
    {{
        config(
            unique_key='host_id',
            strategy='timestamp',
            updated_at='created_at',
            hard_deletes='invalidate',
            dbt_valid_to_current="to_date('9999-12-31')",
            enabled=False
        )
    }}
SELECT * FROM {{ ref('dim_hosts_cleansed') }}
{% endsnapshot %}