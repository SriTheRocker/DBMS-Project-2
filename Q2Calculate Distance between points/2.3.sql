/*Query to find the distance between Central Park and Grand Central Terminal, with the condition that 
the point for Central Park must have the amenity 'bar' and the point for Grand Central Terminal must 
have the operator 'Metropolitan Transportation Authority'.*/

SELECT 
    'Central Park' AS location1, 
    'Grand Central Terminal' AS location2, 
    ST_DistanceSphere(
        ST_SetSRID(
            ST_MakePoint(
                (SELECT ST_X(ST_Transform(way, 4326)) FROM planet_osm_point WHERE name = 'Central Park' AND 
				 amenity = 'bar'),
                (SELECT ST_Y(ST_Transform(way, 4326)) FROM planet_osm_point WHERE name = 'Central Park'AND 
				 amenity = 'bar')
            ),
            4326
        ),
        ST_SetSRID(
            ST_MakePoint(
                (SELECT ST_X(ST_Transform(way, 4326)) FROM planet_osm_point WHERE name = 'Grand Central Terminal' AND 
				 operator = 'Metropolitan Transportation Authority'),
                (SELECT ST_Y(ST_Transform(way, 4326)) FROM planet_osm_point WHERE name = 'Grand Central Terminal' AND 
				 operator = 'Metropolitan Transportation Authority')
            ),
            4326
        )
    ) AS distance_in_meters;

SELECT *, ST_X(ST_Transform(way, 4326)) FROM planet_osm_point WHERE name = 'Grand Central Terminal';