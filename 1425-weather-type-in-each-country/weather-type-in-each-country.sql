-- Write your PostgreSQL query statement below
SELECT country_name, weather_type
FROM Countries c
INNER JOIN (
    SELECT
        country_id,
        CASE 
            WHEN AVG(weather_state) <= 15 THEN 'Cold'
            WHEN AVG(weather_state) >= 25 THEN 'Hot'
            ELSE 'Warm'
        END AS weather_type
    FROM Weather
    WHERE EXTRACT(YEAR FROM day)=2019 AND EXTRACT(MONTH FROM day)=11
    GROUP BY country_id

) w ON c.country_id = w.country_id


