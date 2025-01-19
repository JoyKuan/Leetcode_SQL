-- Write your PostgreSQL query statement below
WITH not_ban AS(
    SELECT users_id
    FROM Users
    WHERE banned='No'
)

SELECT request_at AS Day,
    ROUND(AVG(CASE WHEN status IN ('cancelled_by_driver', 'cancelled_by_client') THEN 1.0 ELSE 0 END), 2) AS "Cancellation Rate"
FROM Trips
WHERE (request_at between '2013-10-01' and '2013-10-03') AND (client_id IN (SELECT * FROM not_ban)) AND (driver_id IN (SELECT * FROM not_ban)) 
GROUP BY request_at

