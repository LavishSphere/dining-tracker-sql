# Dining Tracker SQL

**By: Ashsmith Khayrul & Tuna Ercan**

Students and other community members often struggle to quickly access accurate nutrition information for dining hall menus especially here at Northeastern. This project plans to fetch live menu data from DineOnCampus, including calories, serving sizes, and meal periods, and presents it in a structured and usable format. Users can track what they eat, plan meals according to dietary goals, and gain insights into campus dining options.

---

## User Personas

- **Students** — Want to monitor daily calorie intake and plan meals according to diet or fitness goals.
- **Community Members** — Interested in understanding what's being served and its nutritional content.
- **Dietitians** — Looking to analyze menu options for health, wellness, or research purposes.
- **Developers** — Want structured, programmatic access to campus menu data for analytics or apps.

---

## User Stories

- A student wants to see the calories and serving sizes for each menu item in the dining hall, so they can plan their meals.
- A community member wants to filter meals by calories or portion size, so they can choose options that fit their diet.
- A dietitian wants to collect historical menu data, so they can analyze trends in campus nutrition.
- A developer wants to access menu data programmatically, so they can build apps or dashboards for students to make informed choices.

---

## Database

The database file can be found in [nutrition-tracker.db](./nutrition-tracker.db)

---

## Project Artifacts

- [#1 Requirements](./requirements.pdf) — Rules of the database in problem domain language, with identified nouns and actions.

- [#2 UML Conceptual Model](./uml.png) — Conceptual model in UML ([view on LucidChart](https://lucid.app/lucidchart/b4d9cbfe-29b3-4788-a606-f0eef0d5d54b/edit?invitationId=inv_1fda9732-cb01-4019-893d-9190707796de))

- [#3 ERD](./erd.png) — Logical data model as an ERD ([view on LucidChart](https://lucid.app/lucidchart/86a4adb3-01f6-4d5c-b35e-1e7635901b80/edit?invitationId=inv_9b595cde-6344-45bb-8fbd-4ba95c8b4fe4))

- [#4 Relational Schema](./relational-schema.pdf) — Relational schema in at least BCNF.

- [#5 SQL Definitions](./definition-statements.sql) — SQL data definition statements. ([screenshot](./definition-statements.png))

- [#6 Test Data](./test-data.sql) — Tables populated with test data.

- [#7 Queries](./queries) — Five or more queries demonstrating the database.

- **#8 Application** — A basic CRUD application for at least two tables with a foreign key relationship. *(Separate repository)*
