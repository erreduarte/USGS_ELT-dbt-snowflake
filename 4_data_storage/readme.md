# Snowflake Schema Overview

In this section, I provide an overview of the Snowflake schema used in the project to manage and store earthquake data effectively. The schema is organized into three main sections: **Raw Data**, **Staging Data**, and **Final Data**. Each section plays a crucial role in the ELTL (Extract, Load, Transform, Load) process, ensuring that the data is properly ingested, transformed, and structured for analysis.

![Snowflake Schema Diagram](/assets/snowflake_diagram.png)

## 1. Raw Data Schema

### `RAW_EARTHQUAKE_HISTORY`
This table serves as the initial landing zone for raw earthquake data extracted from the **USGS Earthquake API**. The data is consumed from Kafka using **Apache Spark** and is saved in its original JSON format, allowing for flexible handling of diverse attributes provided by the API. This raw data is crucial for debugging and validating the initial extraction process before any transformations are applied.


## 2. Staging Data Schema

### `STG_EARTHQUAKE_HISTORY`
The staging table is a critical intermediate step in the data pipeline. Here, raw data is transformed using **dbt (Data Build Tool)** to eliminate duplicates and ensure data integrity. Key aspects of this table include:

- **Attributes**: It contains essential earthquake metrics such as `MAGNITUDE`, `PLACE`, and timestamps (`REGISTERED_AT` and `UPDATED_AT`). Additional fields capture geographic, operational, and alert-related information.
- **Data Cleaning**: The staging table allows for debugging and data quality checks. It uses logic to address issues like duplicate entries that may arise from the raw data, ensuring that only the most recent and relevant records are retained.


## 3. Final Data Schema

The final structured data is organized into dimension and fact tables, following a star schema design. This design was chosen due to the specific necessities of the ELTL process in this project, facilitating efficient querying and analysis. 

> **Note**: It is important to note that other schemas could be designed depending on various factors in the context of the data warehouse, such as user requirements, concurrency, and data access patterns. This star schema is a simple showcase choice to demonstrate the project's structure.


### Dimension Tables

- **`DIM_LOCATION_USGS_EQ`**: This table stores detailed geographic information about the earthquakes, including latitude, longitude, altitude, and the place name. Each record is linked to a unique earthquake event through its ID.

- **`DIM_PROPERTIES_USGS_EQ`**: This table contains descriptive properties of each earthquake event, such as its type, title, URL for more information, and other relevant details. This enhances the context around each earthquake recorded in the dataset.

- **`DIM_STATUS_USGS_EQ`**: Captures the status of the earthquake event, including alerts, felt reports, and other metrics related to public impact and response.

### Fact Table

- **`FACTS_USGS_EQ`**: This table serves as the central repository of quantitative metrics related to earthquakes. It consolidates key performance indicators such as magnitude, tsunami occurrence, and other relevant measurements. The fact table allows for comprehensive analysis and reporting, linking back to the dimension tables for enriched context.

## Conclusion

The Snowflake schema is designed to ensure a streamlined flow of data from extraction to analysis. By organizing data into raw, staging, and final structures, this schema facilitates efficient data handling, rigorous validation, and insightful analytics on real-time earthquake events.
