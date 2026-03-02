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
