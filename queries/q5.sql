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
