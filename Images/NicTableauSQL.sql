# Tract per Community
SELECT CommunityID, count(CensusTract) as nTracts
FROM GeoJoinTable
GROUP BY CommunityID;

# Low access tracts at 1/2 mile heatmapped with no access to vehicles
SELECT LATracts_half as 'Low access tract at half mile'
FROM FoodSecurity;

# Tract metrics 
SELECT *
FROM FoodSecurity;

# Tract demo
SELECT fs.CensusTract, fs.POP2010, fs.MedianFamilyIncome
FROM 
FoodSecurity fs
;
