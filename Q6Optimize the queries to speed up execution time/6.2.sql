/*Query to find all the universities in New York and returns their names and coordinates:*/

CREATE INDEX amenity_index ON planet_osm_point (amenity);

SELECT name, ST_X(way) AS lon, ST_Y(way) AS lat
FROM planet_osm_point
WHERE amenity = 'university';

/*This index would allow the database to quickly find all nodes with an amenity value of 'university' 
without having to scan the entire table*/



