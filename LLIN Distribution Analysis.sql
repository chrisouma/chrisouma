-- create a llin_analysis database
CREATE DATABASE llin_analysis;
-- select the llin_analysis
USE llin_analysis;
-- Create a table named amef_distributions_analysis
CREATE TABLE llin_distributions_analysis(
ID INT AUTO_INCREMENT PRIMARY KEY,
Number INT,
location VARCHAR(30),
country VARCHAR(30),
year INT,
by_whom VARCHAR(30),
country_code VARCHAR(20)
);
-- select all records from amef_distributions_analyysis table
SELECT * FROM llin_distributions_analysis ;
-- Checking for null values
SELECT *
FROM llin_distributions_analysis
WHERE country_code is null;
-- Descriptive statistics
SELECT country, SUM(Number) AS total_llins_distributed      -- total number of llins distributed per country
FROM llin_distributions_analysis
GROUP BY country;
SELECT ID, AVg(Number) AS avg_per_event               -- average of number of LLins distributed per event
FROM llin_distributions_analysis
GROUP BY ID;
SELECT                          -- earliest and latest distribution dates in the dataset.
MIN(year) AS earliest_date,
MAX(year) AS latest_date
FROM llin_distributions_analysis;
--  Trends and Patterns
SELECT by_whom,SUM(Number) AS total_distributed_number_per_event                        --  total number of LLINs distributed by each organization
FROM  llin_distributions_analysis
GROUP BY by_whom;
SELECT year,SUM(Number) AS total_number_distributed_per_year                          --  total number of LLINs distributed in each year
FROM llin_distributions_analysis
GROUP BY year;
-- Volume Insights
SELECT location, SUM(Number) AS total_llins_distributed            -- locations with the highest
FROM llin_distributions_analysis
GROUP BY location
ORDER BY total_llins_distributed DESC
LIMIT 1;
SELECT location,SUM(Number) AS total_llins_distributed                 -- Locations with the lowest 
FROM llin_distributions_analysis
GROUP BY location
ORDER BY total_llins_distributed ASC
LIMIT 1;
-- Identifying Extremes
SELECT AVG(Number) AS mean_llins,                     -- Mean and standard deviation
STDDEV(Number) AS stddev_llins
FROM llin_distributions_analysis;




