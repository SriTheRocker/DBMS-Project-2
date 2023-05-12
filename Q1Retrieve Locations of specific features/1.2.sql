SELECT ST_AsText(way), name AS school_name, amenity
FROM planet_osm_point
WHERE amenity = 'school' AND name IS NOT NULL;


/*The above query retrieves the spatial coordinates of all the points of interest from the 
"planet_osm_point" table where the "amenity" is equal to 'school' and the "name" is not null.
It projects the "way" column as the spatial text and renames the "name" column as "school_name". 
The "amenity" column is also projected in the output.*/