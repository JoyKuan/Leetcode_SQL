-- Write your PostgreSQL query statement below
WITH airport_cte AS(
    SELECT departure_airport AS airport_id, flights_count FROM Flights
    UNION ALL
    SELECT arrival_airport AS airport_id, flights_count FROM Flights
),
ranking_cte AS(
    SELECT airport_id, 
        SUM(flights_count) AS flight_total,
        RANK() OVER(ORDER BY SUM(flights_count) DESC) AS rnk
    FROM airport_cte
    GROUP BY airport_id
)

SELECT airport_id
FROM ranking_cte
WHERE rnk = 1






