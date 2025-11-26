# 🧹 SQL Data Cleaning Project: Global Layoffs

## 📌 Project Overview
In this project, I cleaned a raw dataset containing global company layoffs (2020-2023) using **MySQL**. The goal was to transform messy, unstructured data into a standardized format that is ready for analysis and visualization in Business Intelligence tools like Power BI.

**Key Objectives:**
* Remove duplicate records.
* Standardize inconsistent text (Industry names, Country names).
* Handle `NULL` values and missing data.
* Optimize data types for time-series analysis.

## 🛠️ SQL Skills Applied
* **Window Functions:** Used `ROW_NUMBER()` with `PARTITION BY` to identify and remove duplicate rows while preserving unique data.
* **Data Transformation:** Utilized `STR_TO_DATE()` to convert text-based dates into standard `DATE` format.
* **Self-Joins:** Applied self-joins to populate missing `Industry` data by referencing other records from the same company.
* **String Manipulation:** Used `TRIM()` and `TRAILING` to clean dirty text data.

## 🔍 Process Breakdown

### 1. Data Staging
I created a staging table (`layoffs_staging2`) to perform cleaning operations without modifying the raw dataset. This ensures data safety and allows for error recovery.

### 2. Duplicate Removal
Using a window function, I partitioned the data by all relevant columns to flag duplicates.
```sql
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, ... ) AS row_num
