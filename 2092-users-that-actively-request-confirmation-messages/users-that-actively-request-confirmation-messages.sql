-- Write your PostgreSQL query statement below
-- SELECT DISTINCT A.user_id AS user_id
-- FROM Confirmations A
-- INNER JOIN Confirmations B
-- ON A.user_id = B.user_id 
-- AND A.time_stamp < B.time_stamp
-- AND B.time_stamp - A.time_stamp <= INTERVAL '24 hours'

-- Write your PostgreSQL query statement below
SELECT DISTINCT user_id
FROM (
    SELECT
        user_id,
        time_stamp,
        LEAD(time_stamp) OVER(PARTITION BY user_id ORDER BY time_stamp) AS next_time
    FROM Confirmations
) 
WHERE next_time IS NOT NULL AND next_time - time_stamp <= INTERVAL '24 hours'



