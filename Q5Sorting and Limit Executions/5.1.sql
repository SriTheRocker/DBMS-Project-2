/*Query that retrieves information on schools and hospitals in the area, and counts the number 
of restaurants within 500 meters of either the school or the hospital, and within 1000 meters of each other.*/

SELECT
t1.name AS school_name,
t2.name AS hospital_name,
COUNT(t3.*) AS num_restaurants
FROM
(SELECT name, ST_Transform(way, 4326) AS way FROM planet_osm_point WHERE amenity = 'school') t1
LEFT JOIN
(SELECT name, ST_Transform(way, 4326) AS way FROM planet_osm_point WHERE amenity = 'hospital') t2
ON
ST_DistanceSphere(t1.way, t2.way) < 1000
LEFT JOIN
(SELECT name, ST_Transform(way, 4326) AS way FROM planet_osm_point WHERE amenity = 'restaurant') t3
ON
ST_DistanceSphere(t1.way, t3.way) < 500 OR ST_DistanceSphere(t2.way, t3.way) < 500
GROUP BY
t1.name, t2.name
ORDER BY
num_restaurants DESC
LIMIT
10;
