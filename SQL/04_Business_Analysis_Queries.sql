==========================================
-- BUSINESS ANALYSIS QUERIES
-- ==========================================

USE SustainableDevelopmentDB;

-- ==========================================
-- Query 1: Top 10 Countries by GDP per Capita
-- ==========================================

SELECT
    Country,
    ROUND(GDP_Per_Capita_USD, 2) AS GDP_Per_Capita_USD
FROM vw_sustainability_metrics
WHERE GDP_Per_Capita_USD IS NOT NULL
  AND GDP_Per_Capita_USD > 0
ORDER BY GDP_Per_Capita_USD DESC
LIMIT 10;

-- ==========================================
-- Query 2: Highest CO2 Emissions per Capita
-- ==========================================

SELECT
    Country,
    ROUND(CO2_Tonnes_Per_Capita, 2) AS CO2_Tonnes_Per_Capita
FROM vw_sustainability_metrics
WHERE CO2_Tonnes_Per_Capita IS NOT NULL
  AND CO2_Tonnes_Per_Capita > 0
ORDER BY CO2_Tonnes_Per_Capita DESC
LIMIT 10;

-- ==========================================
-- Query 3: Highest Energy Consumption per Capita
-- ==========================================

SELECT
    Country,
    ROUND(Energy_QuadBTU_Per_Million_People, 2) AS Energy_QuadBTU_Per_Million_People
FROM vw_sustainability_metrics
WHERE Energy_QuadBTU_Per_Million_People IS NOT NULL
  AND Energy_QuadBTU_Per_Million_People > 0
ORDER BY Energy_QuadBTU_Per_Million_People DESC
LIMIT 10;

-- ==========================================
-- Query 4: Highest Carbon Intensity
-- ==========================================

SELECT
    Country,
    ROUND(CO2_Tonnes_Per_Billion_GDP, 2) AS CO2_Tonnes_Per_Billion_GDP
FROM vw_sustainability_metrics
WHERE CO2_Tonnes_Per_Billion_GDP IS NOT NULL
  AND CO2_Tonnes_Per_Billion_GDP > 0
ORDER BY CO2_Tonnes_Per_Billion_GDP DESC
LIMIT 10;

-- ==========================================
-- Query 5: Highest Population Density
-- ==========================================

SELECT
    Country,
    ROUND(Population_Density, 2) AS People_Per_SqKm
FROM vw_sustainability_metrics
WHERE Population_Density IS NOT NULL
  AND Population_Density > 0
ORDER BY Population_Density DESC
LIMIT 10;

-- ==========================================
-- Query 6: Ranking Countries by GDP per Capita
-- ==========================================

SELECT
    Country,
    ROUND(GDP_Per_Capita_USD, 2) AS GDP_Per_Capita_USD,
    RANK() OVER (ORDER BY GDP_Per_Capita_USD DESC) AS GDP_Rank
FROM vw_sustainability_metrics
WHERE GDP_Per_Capita_USD > 0;

-- ==========================================
-- Query 7: Countries Above Global Average GDP per Capita
-- ==========================================

SELECT
    Country,
    ROUND(GDP_Per_Capita_USD, 2) AS GDP_Per_Capita_USD
FROM vw_sustainability_metrics
WHERE GDP_Per_Capita_USD >
(
    SELECT AVG(GDP_Per_Capita_USD)
    FROM vw_sustainability_metrics
)
ORDER BY GDP_Per_Capita_USD DESC;

-- ==========================================
-- Query 8: Income Category Classification
-- ==========================================

SELECT
    Country,
    ROUND(GDP_Per_Capita_USD, 2) AS GDP_Per_Capita_USD,
    CASE
        WHEN GDP_Per_Capita_USD >= 50000 THEN 'High Income'
        WHEN GDP_Per_Capita_USD >= 20000 THEN 'Upper Middle Income'
        WHEN GDP_Per_Capita_USD >= 10000 THEN 'Middle Income'
        ELSE 'Lower Income'
    END AS Income_Category
FROM vw_sustainability_metrics
ORDER BY GDP_Per_Capita_USD DESC;