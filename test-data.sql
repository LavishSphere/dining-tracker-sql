-- #6 Populate the tables with test data.

INSERT INTO User (user_id, email, display_name, created_at) VALUES
(1, 'alex.smith@university.edu', 'Alex Smith', '2025-01-15 08:30:00'),
(2, 'j.doe@campus.com', 'Jane Doe', '2025-01-16 09:15:00'),
(3, 'tech_wizard99@gmail.com', 'Morgan V.', '2025-01-20 14:00:00'),
(4, 'fitness_fanatic@outlook.com', 'Chris Irons', '2025-02-01 11:45:00'),
(5, 'sam.lee@college.edu', 'Sam Lee', '2025-02-05 16:20:00'),
(6, 'casey.jones@university.edu', 'Casey J.', '2025-02-10 07:10:00'),
(7, 'blake.miller@campus.com', 'Blake M.', '2025-02-12 19:30:00'),
(8, 'nutrition_pro@health.org', 'Jordan Health', '2025-02-15 12:00:00'),
(9, 'taylor.swiftie@college.edu', 'Taylor S.', '2025-02-20 10:15:00'),
(10, 'riley.green@university.edu', 'Riley Green', '2025-02-28 21:00:00');

INSERT INTO DiningLocation (location_id, name, campus, is_active) VALUES
(1, 'North Hall Commons', 'North Campus', 1),
(2, 'The Underground Grill', 'South Campus', 1),
(3, 'Summit Peak Bistro', 'West Campus', 1),
(4, 'Old Oak Café', 'North Campus', 0),
(5, 'The Greenhouse (Salad Bar)', 'Main Quad', 1),
(6, 'Library Coffee Express', 'Main Quad', 1);

INSERT INTO MealPeriod (meal_period_id, name, start_time, end_time) VALUES
(1, 'Breakfast', '07:00', '10:30'),
(2, 'Brunch',    '10:30', '14:00'),
(3, 'Lunch',     '11:00', '14:30'),
(4, 'Dinner',    '17:00', '21:00'),
(5, 'Late Night','21:00', '23:59');

INSERT INTO SourceSystem (source_system_id, name) VALUES
(1, 'CBORD'),                
(2, 'Nutrislice'),         
(3, 'Aramark Central'),     
(4, 'Manual Entry (Admin)'), 
(5, 'Grubhub Campus');      

INSERT INTO MenuCategory (category_id, category_name) VALUES
(1, 'Entrees'),
(2, 'Sides'),
(3, 'Vegan & Plant-Based'),
(4, 'Gluten-Free Selections'),
(5, 'Desserts'),
(6, 'Beverages'),
(7, 'Soups & Salads'),
(8, 'Breakfast Classics');

INSERT INTO ServingUnit (serving_unit_id, unit_name) VALUES
(1, 'Grams (g)'),
(2, 'Ounces (oz)'),
(3, 'Fluid Ounces (fl oz)'),
(4, 'Cups'),
(5, 'Milliliters (ml)'),
(6, 'Each / Item'),    
(7, 'Scoop'),         
(8, 'Tablespoon (tbsp)');

INSERT INTO MenuStation (station_id, station_name, location_id) VALUES
(1, 'Main Line Grill', 1),    
(2, 'The Salad Garden', 1),   
(3, 'Global Flavors', 1),    
(4, 'The Sizzle Station', 2), 
(5, 'Grab & Go Cold Case', 2),
(6, 'Artisan Deli', 3),      
(7, 'Vegan Corner', 3),       
(8, 'Custom Bowl Bar', 5),    
(9, 'Smoothie Station', 5),   
(10, 'Brewed Awakenings', 6);

INSERT INTO MenuSnapshot (
    menu_snapshot_id, menu_date, fetched_at, source_reference, 
    is_complete, location_id, meal_period_id, source_system_id
) VALUES
(1, '2026-03-01', '2026-03-01 06:00:00', 'REF-001-A', 1, 1, 1, 1),
(2, '2026-03-01', '2026-03-01 10:00:00', 'REF-002-B', 1, 1, 3, 1),
(3, '2026-03-01', '2026-03-01 10:15:00', 'NUTRI-99',  1, 2, 3, 2),
(4, '2026-03-01', '2026-03-01 16:00:00', 'ARAM-XJ9',  1, 3, 4, 3),
(5, '2026-03-01', '2026-03-01 20:00:00', 'MAN-01',    1, 6, 5, 4),
(6, '2026-03-02', '2026-03-02 06:00:00', NULL,       0, 1, 1, 1);

INSERT INTO MenuItem (menu_item_id, name, allergen_tags, category_id) VALUES
(1, 'Classic Cheeseburger', 'Dairy, Gluten, Soy', 1),
(2, 'Quinoa & Black Bean Power Bowl', 'Vegan, Soy-Free', 3),
(3, 'Grilled Lemon Herb Chicken', 'None', 1),
(4, 'Steamed Broccoli with Garlic', 'Vegan, Gluten-Free', 2),
(5, 'Double Chocolate Fudge Brownie', 'Dairy, Egg, Gluten, Tree Nuts', 5),
(6, 'Mixed Berry Smoothie', 'Dairy', 6),
(7, 'Homestyle Macaroni and Cheese', 'Dairy, Gluten', 1),
(8, 'Garden Side Salad', 'Vegan, Gluten-Free', 7),
(9, 'Fluffy Buttermilk Pancakes', 'Dairy, Egg, Gluten', 8),
(10, 'Red Lentil Dal', 'Vegan, Gluten-Free', 3);

INSERT INTO NutritionFactVersion (
    nutrition_version_id, calories, serving_size_value, 
    recorded_at, menu_item_id, serving_unit_id
) VALUES
(1, 550.0, 1.0, '2025-01-01 08:00:00', 1, 6), 
(2, 580.0, 1.0, '2026-02-15 10:00:00', 1, 6), 
(3, 420.0, 12.0, '2025-01-01 08:00:00', 2, 2), 
(4, 180.0, 4.0, '2025-01-01 08:00:00', 3, 2), 
(5, 320.0, 1.0, '2025-01-01 08:00:00', 5, 6), 
(6, 210.0, 12.0, '2025-01-01 08:00:00', 6, 3), 
(7, 450.0, 1.0, '2025-01-01 08:00:00', 7, 4), 
(8, 280.0, 1.5, '2025-01-01 08:00:00', 10, 4);

INSERT INTO MenuItemOffering (
    offering_id, display_portion, menu_snapshot_id, 
    menu_item_id, station_id, nutrition_version_id
) VALUES
(1, '2 Pancakes', 1, 9, 1, NULL), 
(2, '1 Burger', 2, 1, 1, 2),    
(3, '1/2 Cup', 2, 4, 2, NULL),   
(4, '1 Bowl',  2, 2, 3, 3),    
(5, '1 Burger', 3, 1, 4, 2),    
(6, '1 Brownie', 3, 5, 5, 5),   
(7, '6 oz Breast', 4, 3, 6, 4),  
(8, '1 Cup', 4, 10, 7, 8);

INSERT INTO ConsumptionEntry (
    consumption_entry_id, consumed_at, quantity, user_id, offering_id
) VALUES
(1, '2026-03-01 12:15:00', 1.0, 1, 2),
(2, '2026-03-01 12:20:00', 0.5, 1, 3),
(3, '2026-03-01 13:00:00', 1.0, 2, 4),
(4, '2026-03-01 12:45:00', 1.0, 4, 5),
(5, '2026-03-01 13:05:00', 1.0, 4, 6),
(6, '2026-03-01 18:30:00', 2.0, 5, 7),
(7, '2026-03-01 18:45:00', 1.0, 5, 8),
(8, '2026-03-01 14:10:00', 1.0, 6, 6);

INSERT INTO GoalType (goal_type_id, goal_type_name) VALUES
(1, 'Daily Calorie Limit'),
(2, 'Minimum Protein (g)'),
(3, 'Maximum Sodium (mg)'),
(4, 'Target Fiber (g)'),
(5, 'Maximum Carbohydrates (g)'),
(6, 'Water Intake (oz)');

INSERT INTO DietaryGoal (
    goal_id, target_value, unit, start_date, 
    end_date, user_id, goal_type_id
) VALUES
(1, 2000.0, 'kcal', '2026-01-15', '2026-05-15', 1, 1),
(2, 50.0, 'g', '2026-01-20', NULL, 2, 2),
(3, 2300.0, 'mg', '2026-03-01', '2026-03-31', 4, 3),
(4, 30.0, 'g', '2026-03-01', '2026-03-31', 4, 4),
(5, 150.0, 'g', '2026-02-01', NULL, 5, 2),
(6, 100.0, 'oz', '2026-02-01', NULL, 5, 6),
(7, 100.0, 'g', '2026-03-01', '2026-03-08', 6, 5);

INSERT INTO MealPlan (meal_plan_id, plan_date, notes, user_id) VALUES
(1, '2026-03-02', 'Trying to stick to under 2000 calories today.', 1),
(2, '2026-03-02', 'High protein focus for post-workout recovery.', 2),
(3, '2026-03-04', 'Quick grab-and-go options only.', 4),
(4, '2026-03-07', 'Brunch with the track team.', 5),
(5, '2026-03-02', 'Meatless Monday plan.', 6),
(6, '2026-03-03', 'Experimental diet day: Low carb.', 1);

INSERT INTO MealPlanItem (meal_plan_id, menu_item_id, planned_quantity) VALUES
(1, 1, 1),
(1, 8, 1),
(2, 3, 2),
(2, 4, 1),
(3, 6, 1),
(3, 5, 1),
(4, 9, 3),
(4, 6, 1),
(5, 10, 1),
(5, 4, 2),
(6, 3, 2),
(6, 2, 1);
