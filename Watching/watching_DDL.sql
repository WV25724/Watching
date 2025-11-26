-- Creating the database
/* -- SSIS cannot read GO statements, so run this in SSMS before executing SSIS package
DROP DATABASE IF EXISTS watching;
CREATE DATABASE watching;

GO 
USE watching;
GO
*/
-- Creating the tables
-- Need to double check if all of the coded columns are in the updated ERD 

DROP TABLE IF EXISTS fact_watches;
DROP TABLE IF EXISTS dim_collection;
DROP TABLE IF EXISTS dim_brand;

CREATE TABLE dim_brand (
    brand_id INT IDENTITY(1, 1) PRIMARY KEY
    , name VARCHAR(150)
    , country VARCHAR(15) 
    , age INT
    , founded INT
    , prestige VARCHAR(15)
);

CREATE TABLE dim_collection (
    collection_id INT IDENTITY(1, 1) PRIMARY KEY
    , name VARCHAR(30)
    , price_tier VARCHAR(15)
    , popularity INT
);

CREATE TABLE fact_watches (
    reference VARCHAR(15) NOT NULL PRIMARY KEY -- This is the FACT id
    , brand_id INT FOREIGN KEY REFERENCES dim_brand(brand_id)
    , collection_id INT FOREIGN KEY REFERENCES dim_collection(collection_id)
    , price_category VARCHAR(30)
    , gender VARCHAR(10)
    , movement VARCHAR(12)
    , case_material VARCHAR(15)
    , diameter VARCHAR(6)
    , water_resistance VARCHAR(25)
    , wr_category VARCHAR(10)
    , warranty INT
    , power_reserve INT
    , dial VARCHAR(10)
    , bracelet VARCHAR(20)
    , price_outlier BIT
    , diameter_category varchar(10)
)