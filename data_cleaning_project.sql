-- SQL Data Cleaning Project
-- Dataset: Global Layoffs
-- Created by: Chamila Nirmal

-- 1. REMOVE DUPLICATES

CREATE TABLE layoffs_staging2 (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs;


DELETE
FROM layoffs_staging2
WHERE row_num > 1;

-- 2. STANDARDIZE DATA

UPDATE layoffs_staging2 
SET company = TRIM(company);

UPDATE layoffs_staging2 
SET industry = 'Crypto' 
WHERE industry LIKE 'Crypto%';


UPDATE layoffs_staging2 
SET country = TRIM(TRAILING '.' FROM country) 
WHERE country LIKE 'United States%';


UPDATE layoffs_staging2 
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE layoffs_staging2 
MODIFY COLUMN `date` DATE;

-- 3. HANDLE NULL VALUES & REMOVE UNNECESSARY COLUMNS

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL 
AND t2.industry IS NOT NULL;


DELETE 
FROM layoffs_staging2 
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL;


ALTER TABLE layoffs_staging2 
DROP COLUMN row_num;


SELECT * FROM layoffs_staging2;