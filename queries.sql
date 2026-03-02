-- #7 Define and execute at least five queries that show your database.

-- Shows exactly what a specific user (Alex) ate on March 1st, including the location and the calories for each item.
SELECT 
    u.display_name AS User,
    dl.name AS Location,
    mi.name AS Food_Item,
    ce.quantity,
    nfv.calories * ce.quantity AS total_cals
FROM ConsumptionEntry ce
JOIN User u ON ce.user_id = u.user_id
JOIN MenuItemOffering mio ON ce.offering_id = mio.offering_id
JOIN MenuItem mi ON mio.menu_item_id = mi.menu_item_id
JOIN MenuSnapshot ms ON mio.menu_snapshot_id = ms.menu_snapshot_id
JOIN DiningLocation dl ON ms.location_id = dl.location_id
JOIN NutritionFactVersion nfv ON mio.nutrition_version_id = nfv.nutrition_version_id
WHERE u.user_id = 1;

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

-- Finds stations that have more than one item offered in the current menu snapshots, sorted by variety.
SELECT 
    ms.station_name, 
    COUNT(mio.offering_id) AS item_count
FROM MenuStation ms
JOIN MenuItemOffering mio ON ms.station_id = mio.station_id
GROUP BY ms.station_name
HAVING item_count > 1
ORDER BY item_count DESC;

-- Finds items that are categorized as "Vegan" but specifically do not contain "Soy" in their allergen tags.
SELECT mi.name, mi.allergen_tags, mc.category_name
FROM MenuItem mi
JOIN MenuCategory mc ON mi.category_id = mc.category_id
WHERE (mc.category_name LIKE '%Vegan%' OR mi.allergen_tags LIKE '%Vegan%')
  AND mi.allergen_tags NOT LIKE '%Soy%'

-- Ranks each food item by calorie count within its specific category and label it as "High" or "Low" calorie relative to a 400-calorie threshold.
SELECT 
    mc.category_name,
    mi.name,
    nfv.calories,
    CASE 
        WHEN nfv.calories >= 400 THEN 'High Calorie'
        ELSE 'Light Option'
    END AS calorie_label,
    RANK() OVER (PARTITION BY mc.category_name ORDER BY nfv.calories DESC) AS rank_in_category
FROM MenuItem mi
JOIN MenuCategory mc ON mi.category_id = mc.category_id
JOIN NutritionFactVersion nfv ON mi.menu_item_id = nfv.menu_item_id;
