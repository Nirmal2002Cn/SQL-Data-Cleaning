# 🧹 SQL Data Cleaning Project – Global Layoffs Dataset

## 📌 Overview
This project focuses on cleaning and preparing the **Global Layoffs Dataset** for further analysis and dashboard creation.  
The dataset contains layoff information reported worldwide between 2020–2023.  
Raw data often includes duplicates, inconsistent text formatting, incorrect date formats, and missing values.  
This project uses **MySQL** to transform the dataset into a clean, reliable, and analysis-ready table.

## 👨‍💻 Author
**Chamila Nirmal**

---

## 🎯 Objectives
The goal of this project is to:
- Remove duplicate records
- Standardize inconsistent text fields  
- Convert date strings into proper `DATE` format  
- Handle missing values appropriately  
- Prepare the dataset for use in BI dashboards or EDA  

---

## 🛠️ Skills Used
- **Window Functions:** `ROW_NUMBER()` for duplicate detection  
- **String Cleaning:** `TRIM()`, text standardization  
- **Date Conversion:** `STR_TO_DATE()`  
- **Self-Joins:** Filling missing values intelligently  
- **Schema Modifications:** `ALTER TABLE`  

---

## 📂 Process Breakdown

### ✅ 1. Remove Duplicates  
A staging table (`layoffs_staging2`) is created where each row is assigned a `row_num` using `ROW_NUMBER()`.  
Rows with `row_num > 1` are removed to eliminate duplicates.

### ✅ 2. Standardize Data  
- Trim unnecessary spaces  
- Standardize industry names (e.g., `"Crypto Currency"` → `"Crypto"`)  
- Remove trailing dots from `country` names  
- Convert the `date` column into `DATE` format  

### ✅ 3. Handle Null Values  
Self-joins are used to populate missing industries based on other records from the same company.  
Completely empty or unhelpful rows (no `total_laid_off` and no `percentage_laid_off`) are deleted.

### ✅ 4. Cleanup Columns  
The helper column `row_num` is removed after use.

---


