SELECT ST_AsText(way), name, amenity
FROM planet_osm_point
WHERE amenity = 'hospital' AND name IS NOT NULL;

/*The above query selects the well-formatted representation of the point geometry of hospitals, 
their names, and amenities from the planet_osm_point table. It only selects records where the
amenity field is 'hospital' and the name field is not null. The ST_AsText function is used to 
convert the point geometry into a well-formatted text representation*/