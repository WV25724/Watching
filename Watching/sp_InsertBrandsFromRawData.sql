/****** Object:  StoredProcedure dbo.InsertBrandsFromRawData    Script Date:27/11/2025 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Wesley		
-- Create date: 27/11/2025
-- Description:	Cleaned Brand Table
-- =============================================
CREATE PROCEDURE dbo.InsertBrandsFromRawData
AS
BEGIN
	SET NOCOUNT ON;
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
 
END
GO
