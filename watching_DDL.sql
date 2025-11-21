-- Creating the database

DROP DATABASE IF EXISTS watching;
CREATE DATABASE watching;

GO
USE watching;
GO

-- Creating the tables
-- Need to double check if all of the coded columns are in the updated ERD 

DROP TABLE IF EXISTS fact_watches;
DROP TABLE IF EXISTS dim_collection;
DROP TABLE IF EXISTS dim_brand;

CREATE TABLE dim_brand (
    brand_id INT IDENTITY(1, 1) PRIMARY KEY
    , name VARCHAR(50)
    , country VARCHAR(15) 
    , age INT
    , founded INT
    , average_price DECIMAL(9, 2)
    , median_price INT
    , price_std DECIMAL(9, 2)
    , prestige VARCHAR(15)
);

CREATE TABLE dim_collection (
    collection_id INT IDENTITY(1, 1) PRIMARY KEY
    , name VARCHAR(30)
    , price_tier VARCHAR(15)
    , popularity INT
);

CREATE TABLE fact_watches (
    reference VARCHAR(15) NOT NULL PRIMARY KEY
    , brand_id INT FOREIGN KEY REFERENCES dim_brand(brand_id)
    , coleection_id INT FOREIGN KEY REFERENCES dim_collection(coleection_id)
    , price_category VARCHAR(30)
    , gender VARCHAR(10)
    , movement VARCHAR(12)
    , case_material VARCHAR(15)
    , diameter VARCHAR(6)
    , water_resistance VARCHAR(25)
    , wr_category VARCHAR(10)
    , warrenty INT
    , power_reserve INT
    , dial VARCHAR(10)
    , bracelet VARCHAR(20)
    , price_outlier BIT
    , diameter_category varchar(10)
    , price_vs_brand DECIMAL(9, 8)
    , price_percentile DECIMAL(9, 8)
    , price_zscore DECIMAL(9, 8)
)