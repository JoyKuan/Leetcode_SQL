-- Write your PostgreSQL query statement below
WITH airport_cte AS(
    SELECT departure_airport AS airport_id, SUM(flights_count) AS flight_cnt
    FROM Flights
    GROUP BY departure_airport
    UNION ALL
    SELECT arrival_airport AS airport_id, SUM(flights_count) AS flight_cnt
    FROM Flights
    GROUP BY arrival_airport
),
airport_cte2 AS(
    SELECT airport_id, 
        SUM(flight_cnt) AS flight_total,
        RANK() OVER(ORDER BY SUM(flight_cnt) DESC) AS rnk
    FROM airport_cte
    GROUP BY airport_id
)

SELECT airport_id
FROM airport_cte2
WHERE rnk = 1






