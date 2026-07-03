-- ==========================================
-- Global Energy Consumption & Sustainability Analysis
-- ==========================================

DROP DATABASE IF EXISTS SustainableDevelopmentDB;
CREATE DATABASE SustainableDevelopmentDB;
USE SustainableDevelopmentDB;

-- ==========================================
-- master_clean_2 TABLE
-- ==========================================

DROP TABLE IF EXISTS master_clean_2;

CREATE TABLE master_clean_2 (
    Country TEXT,
    Population_Millions DOUBLE,
    GDP_Billions DOUBLE,
    Land_Area_Sq_Km INT,
    Energy_QuadBTU DOUBLE,
    CO2_Tonnes BIGINT
);