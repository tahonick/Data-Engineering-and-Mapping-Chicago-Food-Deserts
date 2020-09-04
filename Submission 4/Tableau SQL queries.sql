# Census Tract Pop and Income
SELECT fs.CensusTract, fs.POP2010, fs.MedianFamilyIncome
FROM 
FoodSecurity fs;

# Food sources
SELECT chain.FoodSourceName, c.CommunityName, c.CommunityID, 
fs.SquareFootage, fs.ChainID
FROM FoodSources fs
INNER JOIN
ChainID chain ON fs.ChainID = chain.ChainID
INNER JOIN
GeoJoinTable g ON fs.GeoID = g.GeoID
INNER JOIN
CommunityData c ON g.CommunityID = c.CommunityID;

# Community areas
SELECT CommunityID, count(CensusTract) as nTracts
FROM GeoJoinTable
GROUP BY CommunityID;

# Community populations
SELECT CommunityName, SUM(POP2010) AS Population,
AVG(MedianFamilyIncome) AS MedianFamilyIncome,
AVG(AdultObesityNumber) AS AdultObesity,
AVG(AdultObesityNumber)/sum(POP2010) AS ObesityPercent,
AVG(EasyAccessFruitVegNumber)/sum(POP2010) AS EasyAccess,
AVG(AdultFruitVegServingsNumber)/sum(POP2010) AS VegServings,
AVG(AdultSodaConsumptionNumber)/sum(POP2010) AS Pop,
AVG(povertyrate) AS PovertyRate
FROM
(SELECT DISTINCT(g.CensusTract), c.CommunityName, f.POP2010 AS POP2010, g.CommunityID, f.MedianFamilyIncome,
c.AdultObesityNumber, c.EasyAccessFruitVegNumber, c.AdultFruitVegServingsNumber, c.AdultSodaConsumptionNumber,
f.povertyrate
	FROM GeoJoinTable g
    INNER JOIN
    CommunityData c ON g.CommunityID = c.CommunityID
    INNER JOIN
    FoodSecurity f ON g.CensusTract = f.CensusTract) AS distcensus
GROUP BY CommunityID;

# Food source ount
SELECT c.CommunityID, COUNT(FoodSourceID) AS Stores, AVG(fs.SquareFootage) AS StoreSize,
SUM(fs.SquareFootage) AS TotalSize, c.CommunityName, AVG(c.AdultObesityNumber)
FROM FoodSources fs
	INNER JOIN
		GeoJoinTable g ON fs.GeoID = g.GeoID
	INNER JOIN
		CommunityData c ON c.CommunityID = g.CommunityID
	INNER JOIN
		FoodSecurity f ON f.CensusTract = g.CensusTract
WHERE fs.SquareFootage > 1
GROUP BY c.CommunityID
ORDER BY c.CommunityID;

SELECT CommunityName, SUM(POP2010) AS Population,
AVG(MedianFamilyIncome) AS MedianFamilyIncome,
AVG(AdultObesityNumber) AS AdultObesity,
AVG(AdultObesityNumber)/sum(POP2010) AS ObesityPercent,
AVG(EasyAccessFruitVegNumber)/sum(POP2010) AS EasyAccess,
AVG(AdultFruitVegServingsNumber)/sum(POP2010) AS VegServings,
AVG(AdultSodaConsumptionNumber)/sum(POP2010) AS Pop,
AVG(povertyrate) AS PovertyRate,
CommunityID
FROM
(SELECT DISTINCT(g.CensusTract), c.CommunityName, f.POP2010 AS POP2010, g.CommunityID, f.MedianFamilyIncome,
c.AdultObesityNumber, c.EasyAccessFruitVegNumber, c.AdultFruitVegServingsNumber, c.AdultSodaConsumptionNumber,
f.povertyrate
	FROM GeoJoinTable g
    INNER JOIN
    CommunityData c ON g.CommunityID = c.CommunityID
    INNER JOIN
    FoodSecurity f ON g.CensusTract = f.CensusTract) AS distcensus
GROUP BY CommunityID;

