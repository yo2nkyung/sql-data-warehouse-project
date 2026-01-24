# sql-data-warehouse-project
Building a modern data warehouse with SQL server, including ETL processes, data modeling, and analytics.

This project demonstrates a comprehensive data warehousing and analytics solution, from building a data warehouse to generating actionable insights. Designed as a portfolio project, it highlights industry best practices in data engineering and analytics.

---
## Data Architecture
The data architecture for this project follows Medallion Architecture **Bronze**, **Silver**, and **Gold** layers.

1. **Bronze Layer**: Stores raw data as-is from the source systems. Data is ingested from CSV Files into SQL Server Database.
2. **Silver Layer**: This layer includes data cleansing, standardization, and normalization processes to prepare data for analysis.
3. **Gold Layer**: Houses business-ready data modeled into a star schema required for reporting and analytics.

---
## 📖 Project Overview

This project involves:

1. **Data Architecture**: Designing a Modern Data Warehouse Using Medallion Architecture **Bronze**, **Silver**, and **Gold** layers.
2. **ETL Pipelines**: Extracting, transforming, and loading data from source systems into the warehouse.
3. **Data Modeling**: Developing fact and dimension tables optimized for analytical queries.
4. **Analytics & Reporting**: Creating SQL-based reports and dashboards for actionable insights.

## Tools that I used:
- **[Datasets]:** Access to the project dataset (csv files).
- **[PostgreSQL]:** Lightweight server for hosting your SQL database.
- **[Git Repository](https://github.com/yo2nkyung/sql-data-warehouse-project):** Set up a GitHub account and repository to manage, version, and collaborate on your code efficiently.
- **[DrawIO]:** Design data architecture, models, flows, and diagrams.
- **[Notion]:** Tool for project management and organization.
- **[Notion Project Steps](https://www.notion.so/Data-Warehouse-Project-2f0fbcf01f788056b84ad665c20994d8?source=copy_link):** Access to All Project Phases and Tasks.

---

## Project Requirements

### Building the Data Warehouse (Data Engineering)

#### Objective
Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

#### Specifications
- **Data Sources**: Import data from two source systems (ERP and CRM) provided as CSV files.
- **Data Quality**: Cleanse and resolve data quality issues prior to analysis.
- **Integration**: Combine both sources into a single, user-friendly data model designed for analytical queries.
- **Scope**: Focus on the latest dataset only; historization of data is not required.
- **Documentation**: Provide clear documentation of the data model to support both business stakeholders and analytics teams.

---
