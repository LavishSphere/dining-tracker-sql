-- Finds items that are categorized as "Vegan" but specifically do not contain "Soy" in their allergen tags.

SELECT mi.name, mi.allergen_tags, mc.category_name
FROM MenuItem mi
JOIN MenuCategory mc ON mi.category_id = mc.category_id
WHERE (mc.category_name LIKE '%Vegan%' OR mi.allergen_tags LIKE '%Vegan%')
  AND mi.allergen_tags NOT LIKE '%Soy%'
