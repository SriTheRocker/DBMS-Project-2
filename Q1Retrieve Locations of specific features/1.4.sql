SELECT ST_AsText(way), name AS bank_name, amenity
FROM planet_osm_point
WHERE amenity = 'bank' and name IS NOT NULL;


/*This query selects the geometry of bank locations from the "planet_osm_point" table, 
along with their name and amenity type. It only includes banks that have a name associated with them 
(i.e., "name" column is not null). The result is presented in well-known text format for the geometry 
column and a "bank_name" column for the name of each bank location.*/