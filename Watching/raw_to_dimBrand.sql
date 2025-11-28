BEGIN TRANSACTION;

INSERT INTO dim_brand (
    name,
    country, 
    age,
    founded,
    prestige 
)

SELECT DISTINCT
    brand,
    brand_country,
    brand_age,
    brand_founded_year,
    brand_prestige_level
FROM raw_data;
COMMIT;
 