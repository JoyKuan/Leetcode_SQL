-- Write your PostgreSQL query statement below
WITH cte AS(
    SELECT
        log_id,
        log_id - ROW_NUMBER() OVER(ORDER BY log_id) AS group_num
    FROM Logs
)

SELECT min(log_id) AS start_id, max(log_id) AS end_id
FROM cte
GROUP BY group_num
ORDER BY start_id 






-- +------------+
-- | log_id     |
-- +------------+
-- | 1          | 1 0
-- | 2          | 2 0
-- | 3          | 3 0
-- | 7          | 4 3
-- | 8          | 5 3
-- | 10         | 6 4
-- +------------+