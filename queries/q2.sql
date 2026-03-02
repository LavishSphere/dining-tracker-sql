-- Identifies which dining locations are currently offering items that are below the average calorie count of all recorded food items.

SELECT DISTINCT name AS Healthy_Locations
FROM DiningLocation
WHERE location_id IN (
    SELECT ms.location_id
    FROM MenuItemOffering mio
    JOIN MenuSnapshot ms ON mio.menu_snapshot_id = ms.menu_snapshot_id
    JOIN NutritionFactVersion nfv ON mio.nutrition_version_id = nfv.nutrition_version_id
    WHERE nfv.calories < (SELECT AVG(calories) FROM NutritionFactVersion)
);
