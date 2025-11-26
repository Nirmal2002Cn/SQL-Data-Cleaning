# 🧹 Data Cleaning in SQL: Global Layoffs Dataset

## 📌 Project Overview
This project demonstrates an end-to-end data cleaning process using MySQL. I took a raw, messy dataset containing global layoff statistics (2020-2023) and transformed it into a clean, standardized format suitable for exploratory data analysis (EDA).

**Goal:** To prepare the data for a Business Intelligence dashboard.

## 🛠️ Skills Applied
* **Window Functions:** Used `ROW_NUMBER()` to identify and remove duplicate entries.
* **Data Transformation:** Used `STR_TO_DATE()` to convert text fields into usable Date formats.
* **Self-Joins:** Applied self-joins to populate missing `Industry` values based on existing company data.
* **String Manipulation:** Used `TRIM()` to clean inconsistent spacing and text formatting.

## 🔍 Key Steps
1.  **Staging:** Created a staging table (`layoffs_staging2`) to ensure the raw data remained intact.
2.  **Deduplication:** Identified duplicates based on company, date, and location, removing 100+ duplicate rows.
3.  **Standardization:** Fixed spelling errors (e.g., "Crypto Currency" → "Crypto") and formatting issues.
4.  **Null Handling:** Removed rows that provided no analytical value (missing both layoff count and percentage).

## 📄 Source
* Dataset: Global Layoffs Dataset (Kaggle)
* *Based on the Data Analyst Bootcamp by Alex The Analyst.*
