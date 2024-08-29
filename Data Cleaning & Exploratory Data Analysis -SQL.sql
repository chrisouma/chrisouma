-- Data Cleaning
SELECT * FROM layoffs;
-- Remove duplicates
-- standardize the data
-- remove null/blank values
-- remove any  columns
CREATE TABLE layoffs_data
LIKE layoffs;
INSERT layoffs_data
SELECT * FROM layoffs;
SELECT * FROM layoffs_data;
-- Duplicates
SELECT * ,
ROW_NUMBER() OVER(
PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,`date`)  row_num
FROM layoffs_data;
WITH duplicate_cte AS
(
SELECT * ,
ROW_NUMBER() OVER(
PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions)  row_num
FROM layoffs_data
)
SELECT * FROM duplicate_cte 
WHERE row_num>1;
DELETE FROM layoffs_data
WHERE company='Cazoo';

CREATE TABLE `layoffs_data2` (
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
SELECT * FROM layoffs_data2;
INSERT INTO layoffs_data2 
SELECT * ,
ROW_NUMBER() OVER(
PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions)  row_num
FROM layoffs_data;
SELECT* FROM layoffs_data2 ;
SET SQL_SAFE_UPDATES = 0;
DELETE FROM layoffs_data2 
WHERE row_num>1;
 
 -- Standardizing data
 SELECT company,TRIM(company)
 FROM layoffs_data2;
 UPDATE layoffs_data2
SET company=TRIM(company);
SELECT DISTINCT(industry)
FROM layoffs_data2
ORDER BY 1;

SELECT DISTINCT industry
FROM layoffs_data2;
UPDATE layoffs_data2
SET industry='Crypto'
WHERE industry LIKE 'Crypto%';
SELECT*
FROM layoffs_data2
WHERE country LIKE 'United States.%'
ORDER BY 1;
SELECT DISTINCT country, TRIM(TRAILING '.'FROM country)
FROM layoffs_data2;

UPDATE layoffs_data2
SET country =TRIM(TRAILING '.'FROM country)
WHERE country LIKE 'United States%';

SELECT `date`,
STR_TO_DATE(`date`,'%m/%d/%Y') Date
FROM layoffs_data2;
UPDATE layoffs_data2
SET `date`=STR_TO_DATE(`date`,'%m/%d/%Y');
SELECT `date`
FROM layoffs_data2;
ALTER TABLE layoffs_data2
MODIFY `date` DATE;
-- NULL VALUES
SELECT *
FROM layoffs_data2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;
SELECT * FROM layoffs_data2
WHERE industry iS NULL 
OR industry='';
UPDATE layoffs_data2
SET industry = NULL
WHERE industry ='';
SELECT  t1.industry,t2.industry
FROM layoffs_data2 t1
JOIN layoffs_data2 t2
	ON t2.industry=t1.industry
WHERE (t1.industry IS NULL or t1.industry ='')
AND t2.industry IS NOT NULL;
UPDATE layoffs_data2 t1
JOIN layoffs_data2 t2 ON t1.company =t2.company
SET t1.industry=t2.industry
WHERE (t1.industry IS NULL or t1.industry ='')
AND t2.industry IS NOT NULL;
SELECT * FROM layoffs_data2
WHERE company='AirBnB';
SELECT * FROM layoffs_data2
WHERE company LIKE 'Bally%';
DELETE FROM layoffs_data2
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL;
-- Droping the row_num column
ALTER TABLE layoffs_data2
DROP COLUMN row_num;
SELECT * FROM layoffs_data2;
-- Exploratory Data analysis
SELECT MIN(total_laid_off),MAX(total_laid_off)
FROM layoffs_data2;
SELECT* FROM layoffs_data2
WHERE percentage_laid_off=1;
SELECT MIN(funds_raised_millions),MAX(funds_raised_millions)
FROM layoffs_data2;
SELECT company,SUM(funds_raised_millions)
FROM layoffs_data2
GROUP BY company
ORDER BY 2 DESC;
SELECT company,SUM(total_laid_off)
FROM layoffs_data2
GROUP BY company
ORDER BY 2 DESC;
SELECT MIN(date),MAX(date)
FROM layoffs_data2;
SELECT industry,SUM(total_laid_off)
FROM layoffs_data2
GROUP BY industry
ORDER BY 2 DESC;
SELECT industry,SUM(funds_raised_millions)
FROM layoffs_data2
GROUP BY industry
ORDER BY 2 DESC;
SELECT country,SUM(total_laid_off)
FROM layoffs_data2
GROUP BY country
ORDER BY 2 DESC;
SELECT country,SUM(funds_raised_millions)
FROM layoffs_data2
GROUP BY country
ORDER BY 2 DESC;
SELECT Year(`date`), country, SUM(total_laid_off)
FROM layoffs_data2
GROUP BY Year(`date`),country
ORDER BY 1 DESC;
SELECT Year(`date`), country, SUM(funds_raised_millions)
FROM layoffs_data2
GROUP BY Year(`date`),country
ORDER BY 1 DESC;
SELECT Year(`date`), company, SUM(total_laid_off)
FROM layoffs_data2
GROUP BY Year(`date`),company
ORDER BY 1 DESC;
SELECT Year(`date`), company, SUM(funds_raised_millions)
FROM layoffs_data2
GROUP BY Year(`date`),company
ORDER BY 1 DESC;
SELECT stage, SUM(total_laid_off)
FROM layoffs_data2
GROUP BY stage
ORDER BY 1 DESC;
SELECT SUBSTRING(`date` ,1,7) `Month`,SUM(total_laid_off)
FROM layoffs_data2
WHERE SUBSTRING(`date` ,1,7) IS NOT NULL
GROUP BY `Month`
ORDER BY 1 ASC;
WITH Rolling_total AS
(
SELECT SUBSTRING(`date` ,1,7) `Month`,country,SUM(total_laid_off) total_off
FROM layoffs_data2
WHERE SUBSTRING(`date` ,1,7) IS NOT NULL
GROUP BY `Month`,country
ORDER BY 1 ASC
) 
SELECT `Month`,total_off,SUM(total_off) OVER(ORDER BY `Month`) rolling_total
FROM Rolling_total; 
SELECT company,Year(`date`),SUM(total_laid_off)
FROM layoffs_data2
GROUP BY company, Year(`date`)
ORDER BY 3 DESC;
WITH Company_Year ( company,years,total_laid_off) AS
(
SELECT company,Year(`date`),SUM(total_laid_off)
FROM layoffs_data2
GROUP BY company, Year(`date`)
ORDER BY 3 DESC
), Company_Year_Ranking AS
(SELECT *,DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) Ranking
FROM Company_Year
WHERE years IS NOT NULL
)
SELECT * FROM Company_Year_Ranking
WHERE Ranking<=5
;
SELECT SUBSTRING(`date` ,1,7) `Month`,SUM(funds_raised_millions)
FROM layoffs_data2
WHERE SUBSTRING(`date` ,1,7) IS NOT NULL
GROUP BY `Month`
ORDER BY 1 ASC;

WITH Rolling_total AS
(
SELECT SUBSTRING(`date` ,1,7) `Month`,country,SUM(funds_raised_millions) funds_raised
FROM layoffs_data2
WHERE SUBSTRING(`date` ,1,7) IS NOT NULL
GROUP BY `Month`,country
ORDER BY 1 ASC
) 
SELECT `Month`,funds_raised,SUM(funds_raised) OVER(ORDER BY `Month`) rolling_total
FROM Rolling_total; 
WITH Company_Year ( company,years,funds_raised_millions) AS
(
SELECT company,Year(`date`),SUM(funds_raised_millions)
FROM layoffs_data2
GROUP BY company, Year(`date`)
ORDER BY 3 DESC
), Company_Year_Ranking AS
(SELECT *,DENSE_RANK() OVER (PARTITION BY years ORDER BY funds_raised_millions DESC) Ranking
FROM Company_Year
WHERE years IS NOT NULL
)
SELECT * FROM Company_Year_Ranking
WHERE Ranking<=5
;