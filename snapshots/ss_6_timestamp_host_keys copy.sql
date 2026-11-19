{% snapshot ss_6_timestamp_host_keys %}
    {{
        config(
            unique_key=['host_id', 'host_name'],
            strategy='timestamp',
            updated_at='created_at',
            hard_deletes='invalidate',
            dbt_valid_to_current="to_date('9999-12-31')",
            snapshot_meta_column_names=  {
                                    'dbt_scd_id':'hash_id',
                                    'dbt_updated_at':'updated_ts',
                                    'dbt_valid_from':'validity_start',
                                    'dbt_valid_to':'validity_end'
                                    }
        )
    }}
SELECT * FROM {{ ref('dim_hosts_cleansed') }}
{% endsnapshot %}