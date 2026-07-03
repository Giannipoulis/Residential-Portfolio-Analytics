-- ==========================================
-- DATA VALIDATION AND QUALITY CHECKS
-- ==========================================

USE SustainableDevelopmentDB;

-- View table structure
DESCRIBE master_clean_2;

-- Count total records
SELECT COUNT(*) AS total_records
FROM master_clean_2;

-- Preview imported data
SELECT *
FROM master_clean_2
LIMIT 10;

-- Check duplicate countries
SELECT
    Country,
    COUNT(*) AS records
FROM master_clean_2
GROUP BY Country
HAVING COUNT(*) > 1;

-- Check missing values
SELECT
    SUM(Country IS NULL) AS missing_country,
    SUM(Population_Millions IS NULL) AS missing_population,
    SUM(GDP_Billions IS NULL) AS missing_gdp,
    SUM(Land_Area_Sq_Km IS NULL) AS missing_land_area,
    SUM(Energy_QuadBTU IS NULL) AS missing_energy,
    SUM(CO2_Tonnes IS NULL) AS missing_co2
FROM master_clean_2;