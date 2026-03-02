-- Finds stations that have more than one item offered in the current menu snapshots, sorted by variety.

SELECT 
    ms.station_name, 
    COUNT(mio.offering_id) AS item_count
FROM MenuStation ms
JOIN MenuItemOffering mio ON ms.station_id = mio.station_id
GROUP BY ms.station_name
HAVING item_count > 1
ORDER BY item_count DESC;
