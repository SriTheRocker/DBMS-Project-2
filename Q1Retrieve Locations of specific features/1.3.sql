SELECT ST_AsText(way), name AS postoffice_name, amenity
FROM planet_osm_point
WHERE amenity = 'post_office' AND name IS NOT NULL;


/*The query is selecting the geometry of all points in the planet_osm_point table with the 
amenity value of post_office and a non-null name value. It is also selecting the name value and 
aliasing it as postoffice_name. Finally, it is also selecting the amenity value.
The ST_AsText function is used to convert the geometry to a text representation.*/
