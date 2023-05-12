/*Query to find all the points of interest (POIs) in the planet_osm_point table that have the 
amenity tag set to 'restaurant'.*/
EXPLAIN ANALYZE
SELECT name, ST_X(way) as longitude, ST_Y(way) as latitude
FROM planet_osm_point
WHERE amenity = 'restaurant'
LIMIT 10;

CREATE INDEX amenity_index ON planet_osm_point (amenity);

/*To optimize the query for the number of rows in the table, we can create an index on the amenity column:*/
