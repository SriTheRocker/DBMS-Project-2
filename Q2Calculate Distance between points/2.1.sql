/*Query to find the distance in meters between the World Trade Center and Pace University*/

SELECT 
    'World Trade Center' AS location1, 
    'Pace University' AS location2, 
    ST_DistanceSphere(
        ST_SetSRID(
            ST_MakePoint(
                (SELECT ST_X(ST_Transform(way, 4326)) FROM planet_osm_point WHERE name = 'World Trade Center' AND operator = 'PATH'),
                (SELECT ST_Y(ST_Transform(way, 4326)) FROM planet_osm_point WHERE name = 'World Trade Center' AND operator = 'PATH')
            ),
            4326
        ),
        ST_SetSRID(
            ST_MakePoint(
                (SELECT ST_X(ST_Transform(way, 4326)) FROM planet_osm_point WHERE name = 'Pace University'),
                (SELECT ST_Y(ST_Transform(way, 4326)) FROM planet_osm_point WHERE name = 'Pace University')
            ),
            4326
        )
    ) AS distance_in_meters;
