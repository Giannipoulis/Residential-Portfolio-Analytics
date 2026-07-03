==========================================
-- CREATE ANALYTICAL VIEWS
-- ==========================================

USE SustainableDevelopmentDB;

-- ==========================================
-- Base View
-- ==========================================

CREATE OR REPLACE VIEW vw_sustainability_base AS
SELECT
    Country,
    Population_Millions,
    GDP_Billions,
    Land_Area_Sq_Km,
    Energy_QuadBTU,
    CO2_Tonnes
FROM master_clean_2;

-- ==========================================
-- Sustainability Metrics View
-- ==========================================

CREATE OR REPLACE VIEW vw_sustainability_metrics AS
SELECT
    Country,
    Population_Millions,
    GDP_Billions,
    Land_Area_Sq_Km,
    Energy_QuadBTU,
    CO2_Tonnes,

    GDP_Billions * 1000 / NULLIF(Population_Millions, 0) AS GDP_Per_Capita_USD,

    CO2_Tonnes / NULLIF(Population_Millions * 1000000, 0) AS CO2_Tonnes_Per_Capita,

    Population_Millions * 1000000 / NULLIF(Land_Area_Sq_Km, 0) AS Population_Density,

    Energy_QuadBTU / NULLIF(Population_Millions, 0) AS Energy_QuadBTU_Per_Million_People,

    CO2_Tonnes / NULLIF(GDP_Billions, 0) AS CO2_Tonnes_Per_Billion_GDP

FROM master_clean_2;

-- ==========================================
-- Dashboard View
-- ==========================================

CREATE OR REPLACE VIEW vw_dashboard AS
SELECT
    Country,
    Population_Millions,
    GDP_Billions,
    CO2_Tonnes,
    GDP_Per_Capita_USD,
    CO2_Tonnes_Per_Capita,
    Population_Density,
    Energy_QuadBTU_Per_Million_People,
    CO2_Tonnes_Per_Billion_GDP
FROM vw_sustainability_metrics;