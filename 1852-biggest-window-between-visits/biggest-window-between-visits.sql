-- Write your PostgreSQL query statement below
WITH UserVisits_cte AS(
    SELECT
        user_id,
        LEAD(visit_date, 1, '2021-1-1'::date) OVER(PARTITION BY user_id ORDER BY visit_date)-visit_date AS wd
    FROM UserVisits
)

SELECT user_id, MAX(wd) AS biggest_window
FROM UserVisits_cte
GROUP BY user_id
ORDER BY user_id
