/*Query to find all the restaurants within a 1 km radius of a specific location:*/

SELECT name, ST_X(way) AS LONGITUDE, ST_Y(way) AS LATITUDE
FROM planet_osm_point
WHERE amenity = 'cafe' AND 
  ST_Intersects(way, ST_Transform(ST_MakeEnvelope(-74.25909, 40.477399, -73.700181, 40.917577, 4326), 3857));

CREATE INDEX ON planet_osm_point USING gist (way);

CREATE INDEX ON planet_osm_point (amenity);

/*To optimize the query, we can create an index on the amenity column to speed up the filtering of points of interest
/*We can also create a spatial index on the way column to speed up the spatial join
