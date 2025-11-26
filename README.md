🧹 Data Cleaning in SQL: Global Layoffs Dataset
📌 Project Overview

This project shows a complete data cleaning workflow using MySQL.
I worked with a raw dataset containing global layoffs from 2020–2023 and transformed it into a clean version ready for Exploratory Data Analysis (EDA) and dashboard building.

Main Goal: Make the data accurate, consistent, and easy to analyze for a Business Intelligence project.

🛠️ Skills Applied

Window Functions: Used ROW_NUMBER() to detect and remove duplicate rows.

Data Type Conversion: Used STR_TO_DATE() to convert text into proper DATE format.

Self-Joins: Filled missing industry values using existing company information.

String Cleaning: Applied TRIM() and pattern matching to fix inconsistent text formatting.

Staging Tables: Worked inside a clean staging table to protect the original dataset.

🔍 Key Steps in the Cleaning Process
1. Create a Staging Table

I created layoffs_staging2 to store a copy of the original data.
This helps keep the raw dataset safe and unchanged.

2. Remove Duplicate Records

Using ROW_NUMBER(), I identified duplicates based on company, location, date, and other fields.
All duplicate rows (row_num > 1) were deleted.

3. Standardize Text Fields

Cleaned extra spaces

Unified industry names (e.g., "Crypto Currency" → "Crypto")

Fixed country names with trailing periods ("United States." → "United States")

4. Convert Date Formats

Changed text dates (MM/DD/YYYY) into proper SQL DATE format for accurate sorting and filtering.

5. Handle Missing Data

Used a self-join to fill missing industries when the same company had a valid industry in another row.

6. Remove Useless Rows

Rows where both total_laid_off AND percentage_laid_off were NULL were removed because they do not provide analytical value.

📄 Source

Dataset: Global Layoffs Dataset (Kaggle)

Project inspired by Alex The Analyst — Data Analyst Bootcamp
