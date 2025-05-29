-- Write your PostgreSQL query statement below
WITH steps_cte AS(
    SELECT
        user_id,
        steps_date,
        lag(steps_date, 2) OVER(
            PARTITION BY user_id 
            ORDER BY steps_date) AS startdate,
        ROUND(AVG(steps_count) OVER(
            PARTITION BY user_id 
            ORDER BY steps_date 
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS rolling_average
    FROM Steps
)

SELECT user_id, steps_date, rolling_average
FROM steps_cte
WHERE steps_date - startdate = 2




-- 


-- | user_id | steps_date | startdate  |
-- | ------- | ---------- | ---------- |
-- | 1       | 2021-09-02 | null       |
-- | 1       | 2021-09-04 | null       |
-- | 1       | 2021-09-05 | 2021-09-02 |
-- | 1       | 2021-09-06 | 2021-09-04 |
-- | 1       | 2021-09-07 | 2021-09-05 |
-- | 2       | 2021-09-06 | null       |
-- | 2       | 2021-09-07 | null       |
-- | 2       | 2021-09-08 | 2021-09-06 |
-- | 3       | 2021-09-04 | null       |
-- | 3       | 2021-09-07 | null       |
-- | 3       | 2021-09-08 | 2021-09-04 |
-- | 3       | 2021-09-09 | 2021-09-07 |
-- | 3       | 2021-09-10 | 2021-09-08 |
-- | 5       | 2021-09-05 | null       |
-- | 6       | 2021-09-01 | null       |
-- | 6       | 2021-09-02 | null       |
-- | 6       | 2021-09-05 | 2021-09-01 |