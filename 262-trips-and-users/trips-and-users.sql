-- Write your PostgreSQL query statement below
SELECT request_at AS Day,
    ROUND(AVG(CASE WHEN status = 'completed' THEN 0 ELSE 1 END), 2) AS "Cancellation Rate"
FROM Trips
WHERE (request_at between '2013-10-01' and '2013-10-03') AND 
(client_id NOT IN (SELECT users_id FROM Users WHERE banned='Yes' AND role='client')) AND 
(driver_id NOT IN (SELECT users_id FROM Users WHERE banned='Yes' AND role='driver')) 
GROUP BY request_at

