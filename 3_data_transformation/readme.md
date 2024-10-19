# Earthquake Data Transformation with dbt

## Overview

This project demonstrates the use of dbt (data build tool) for transforming earthquake data stored in a staging table within Snowflake. The transformation process involves cleansing, organizing, and preparing the data for analysis, ensuring that only unique records are retained for further processing.

![dbt_lineage](assets/dbt_lineage.png)

## Transformation Logic

The dbt model retrieves data from the `raw_earthquake_history` staging table, applying key operations such as:

- **Cleansing:** Rounding, converting, and formatting data fields to appropriate data types.
- **De-duplication:** This process is crucial due to the nature of data streaming with Kafka, where the same earthquake event may be sent multiple times within a 30-minute window. To ensure that only the most recent record for each earthquake is retained, the transformation logic filters out duplicates based on the unique combination of `ID` and `REGISTERED_AT`. By using this approach, we effectively manage potential redundancy in the dataset while ensuring that the most relevant information is preserved for analysis.
- **Data Filtering:** Excluding records that already exist in the destination table to prevent duplication.

For detailed transformation logic, please refer to the SQL file located in the `sql` directory: [staging_table](3_data_transformation/staging_data.sql).

## Final Schema Feeding

The transformation logic also applies to feeding the final schema. When inserting data into the final destination, the model uses a `WHERE` clause to filter out records that are already present in the destination table. This ensures that only new records are added, avoiding duplication.

### Logic of the WHERE Clause

1. **ID and Timestamp Verification:** The code checks both the `ID` and `REGISTERED_AT` timestamp of the records. This combination serves as a unique identifier for each earthquake event, ensuring that only genuinely new records are inserted.

2. **Handling "Fake Duplicates":** The streaming feed sometimes contains "fake duplicates" where records have the same `ID` but different statuses in the `status` column (e.g., `automatic` or `reviewed`). By only comparing the `ID` and timestamp, both versions of the record can be included in the final dataset, preserving important status information.

3. **Milliseconds Differences:** In certain cases, records may have only milliseconds of difference in the `REGISTERED_AT` timestamp, yet possess the same `ID` with different values in the `magnitude` column. The use of the `ROW_NUMBER` function helps to manage these instances, ensuring that both records are included in the final output when they represent distinct seismic events.

By incorporating these checks and logic, the transformation process maintains data integrity while capturing all relevant variations in the dataset.


## Sources Configuration

The sources for this dbt project are defined in the `sources.yml` file as follows:

```yaml
version: 2

sources:
  - name: public  # Model's source reference.
    description: "Raw Streaming USGS Earthquake Data"
    database: EARTHQUAKE_USGS  # The database where the table is stored.
    schema: public  # The schema where the source table is stored.
    tables:
      - name: raw_earthquake_history  # Name of the source table
      
  - name: stg_usgs  # Model's source reference.
    description: "Transformed USGS Earthquake Data"
    database: EARTHQUAKE_USGS  # The database where the table is stored.
    schema: STG_EARTHQUAKE_DATA  # The schema where the source table is stored.
    tables:
      - name: STG_EARTHQUAKE_HISTORY  # Name of the source table


