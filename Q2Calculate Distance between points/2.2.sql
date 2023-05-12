/*Query to calculate the distance between the Avatar Studios and the Times Square subway station in New York City.*/

SELECT 
    'Avatar Studios' AS location1, 
    'Times Square' AS location2, 
    ST_DistanceSphere(
        ST_SetSRID(
            ST_MakePoint(
                (SELECT ST_X(ST_Transform(way, 4326)) FROM planet_osm_point WHERE name = 'Avatar Studios'),
                (SELECT ST_Y(ST_Transform(way, 4326)) FROM planet_osm_point WHERE name = 'Avatar Studios')
            ),
            4326
        ),
        ST_SetSRID(
            ST_MakePoint(
                (SELECT ST_X(ST_Transform(way, 4326)) FROM planet_osm_point WHERE name = 'Times Square' AND public_transport = 'station'),
                (SELECT ST_Y(ST_Transform(way, 4326)) FROM planet_osm_point WHERE name = 'Times Square' AND public_transport = 'station')

            ),
            4326
        )
    ) AS distance_in_meters;

