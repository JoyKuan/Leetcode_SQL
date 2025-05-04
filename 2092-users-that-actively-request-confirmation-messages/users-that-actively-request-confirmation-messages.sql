-- Write your PostgreSQL query statement below
SELECT DISTINCT A.user_id AS user_id
FROM Confirmations A
INNER JOIN Confirmations B
ON A.user_id = B.user_id 
AND A.time_stamp < B.time_stamp
AND B.time_stamp - A.time_stamp <= INTERVAL '24 hours'