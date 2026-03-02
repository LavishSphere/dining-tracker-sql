-- #5 Create a set of SQL data definition statements for the above model and realize that schema in SQLite3 by executing the script from the SQLite3, the console or Node. You can use DB Browser to generate these statements. Show that the tables were created and conform to the constraints through screen shots or other means.

-- 1. User
CREATE TABLE User (
    user_id INTEGER PRIMARY KEY,
    email TEXT NOT NULL UNIQUE,
    display_name TEXT,
    created_at TEXT NOT NULL
);

-- 2. DiningLocation
CREATE TABLE DiningLocation (
    location_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    campus TEXT,
    is_active INTEGER NOT NULL
);

-- 3. MealPeriod
CREATE TABLE MealPeriod (
    meal_period_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    start_time TEXT NOT NULL, 
    end_time TEXT NOT NULL    
);

-- 4. SourceSystem
CREATE TABLE SourceSystem (
    source_system_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

-- 5. MenuCategory
CREATE TABLE MenuCategory (
    category_id INTEGER PRIMARY KEY,
    category_name TEXT NOT NULL UNIQUE
);

-- 6. ServingUnit
CREATE TABLE ServingUnit (
    serving_unit_id INTEGER PRIMARY KEY,
    unit_name TEXT NOT NULL UNIQUE
);

-- 7. MenuStation
CREATE TABLE MenuStation (
    station_id INTEGER PRIMARY KEY,
    station_name TEXT NOT NULL,
    location_id INTEGER NOT NULL,
    FOREIGN KEY (location_id) REFERENCES DiningLocation (location_id)
);

-- 8. MenuSnapshot
CREATE TABLE MenuSnapshot (
    menu_snapshot_id INTEGER PRIMARY KEY,
    menu_date TEXT NOT NULL,         
    fetched_at TEXT NOT NULL,         
    source_reference TEXT,           
    is_complete INTEGER NOT NULL,     
    location_id INTEGER NOT NULL,
    meal_period_id INTEGER NOT NULL,
    source_system_id INTEGER NOT NULL,
    FOREIGN KEY (location_id) REFERENCES DiningLocation (location_id),
    FOREIGN KEY (meal_period_id) REFERENCES MealPeriod (meal_period_id),
    FOREIGN KEY (source_system_id) REFERENCES SourceSystem (source_system_id)
);

-- 9. MenuItem
CREATE TABLE MenuItem (
    menu_item_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    allergen_tags TEXT,
    category_id INTEGER,
    FOREIGN KEY (category_id) REFERENCES MenuCategory (category_id)
);

-- 10. NutritionFactVersion
CREATE TABLE NutritionFactVersion (
    nutrition_version_id INTEGER PRIMARY KEY,
    calories REAL NOT NULL,
    serving_size_value REAL NOT NULL,
    recorded_at TEXT NOT NULL,       
    menu_item_id INTEGER NOT NULL,
    serving_unit_id INTEGER NOT NULL,
    FOREIGN KEY (menu_item_id) REFERENCES MenuItem (menu_item_id),
    FOREIGN KEY (serving_unit_id) REFERENCES ServingUnit (serving_unit_id)
);

-- 11. MenuItemOffering
CREATE TABLE MenuItemOffering (
    offering_id INTEGER PRIMARY KEY,
    display_portion TEXT,
    menu_snapshot_id INTEGER NOT NULL,
    menu_item_id INTEGER NOT NULL,
    station_id INTEGER,
    nutrition_version_id INTEGER,
    FOREIGN KEY (menu_snapshot_id) REFERENCES MenuSnapshot (menu_snapshot_id),
    FOREIGN KEY (menu_item_id) REFERENCES MenuItem (menu_item_id),
    FOREIGN KEY (station_id) REFERENCES MenuStation (station_id),
    FOREIGN KEY (nutrition_version_id) REFERENCES NutritionFactVersion (nutrition_version_id)
);

-- 12. ConsumptionEntry
CREATE TABLE ConsumptionEntry (
    consumption_entry_id INTEGER PRIMARY KEY,
    consumed_at TEXT NOT NULL,          
    quantity REAL NOT NULL,            
    user_id INTEGER NOT NULL,
    offering_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User (user_id),
    FOREIGN KEY (offering_id) REFERENCES MenuItemOffering (offering_id)
);

-- 13. GoalType
CREATE TABLE GoalType (
    goal_type_id INTEGER PRIMARY KEY,
    goal_type_name TEXT NOT NULL UNIQUE
);

-- 14. DietaryGoal
CREATE TABLE DietaryGoal (
    goal_id INTEGER PRIMARY KEY,
    target_value REAL NOT NULL,
    unit TEXT,
    start_date TEXT NOT NULL,           
    end_date TEXT,                  
    user_id INTEGER NOT NULL,
    goal_type_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User (user_id),
    FOREIGN KEY (goal_type_id) REFERENCES GoalType (goal_type_id)
);

-- 15. MealPlan
CREATE TABLE MealPlan (
    meal_plan_id INTEGER PRIMARY KEY,
    plan_date TEXT NOT NULL,
    notes TEXT,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User (user_id)
);

-- 16. MealPlanItem
CREATE TABLE MealPlanItem (
    meal_plan_id INTEGER NOT NULL,
    menu_item_id INTEGER NOT NULL,
    planned_quantity INTEGER NOT NULL,
    PRIMARY KEY (meal_plan_id, menu_item_id),
    FOREIGN KEY (meal_plan_id) REFERENCES MealPlan (meal_plan_id),
    FOREIGN KEY (menu_item_id) REFERENCES MenuItem (menu_item_id)
);
