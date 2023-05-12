/*Query to retrieve number of subway stations located within 500 meters of each park in New York City.*/

SELECT p.name AS park_name, COUNT(*) AS num_subway_stations
FROM planet_osm_point p
JOIN planet_osm_point s ON ST_DistanceSphere(ST_Transform(p.way, 4326), ST_Transform(s.way, 4326)) < 500 AND 
s.railway = 'subway_entrance'
WHERE p.leisure = 'park'
GROUP BY p.name;