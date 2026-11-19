{% docs __overview__ %}
## Overview

 

dbt Seeds are CSV files stored within a dbt project that allow developers to load static or relatively small datasets directly into a data warehouse as database tables.

 

They are commonly used to manage reference data, lookup values, mapping tables, configuration data, and other datasets that do not change frequently.

 

Unlike source tables, which are populated by upstream applications or data ingestion pipelines, seed datasets are maintained as CSV files within the dbt code repository. dbt provides the `dbt seed` command to load these files into the target warehouse.

## Expected data flow of the project is as:
![input schema](assets/dbt-dag.png)

### Key Capabilities

 

- Load CSV files into Snowflake or other supported data warehouses.

- Define database, schema, table alias, and column data types.

- Document seed files and their columns using YAML properties.

- Apply data quality tests such as `unique` and `not_null`.

- Version-control reference datasets alongside dbt models.

- Reuse seed tables in downstream models using the `ref()` function.

 

###

{% enddocs %}