/*Query to retrieve the number of restaurants in each administrative area in New York City, and 
order them based on restaurant count.*/

SELECT
  area.name AS area_name,
  COUNT(*) AS restaurant_count
FROM (
  SELECT name, ST_Transform(way, 3857) AS way
  FROM planet_osm_point
  WHERE amenity = 'restaurant'
) AS restaurant_points
JOIN (
  SELECT name, ST_Transform(way, 3857) AS way
  FROM planet_osm_polygon
  WHERE boundary = 'administrative' AND admin_level = '10'
) AS area
ON ST_Contains(area.way, restaurant_points.way)
GROUP BY area.name
ORDER BY restaurant_count DESC;
