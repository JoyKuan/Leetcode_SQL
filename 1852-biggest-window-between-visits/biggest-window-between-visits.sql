-- Write your PostgreSQL query statement below
WITH UserVisits_cte AS(
    SELECT
        user_id,
        visit_date,
        LEAD(visit_date, 1, '2021-1-1') OVER(PARTITION BY user_id ORDER BY visit_date) AS next_day
    FROM UserVisits
)

SELECT user_id, MAX(next_day - visit_date) AS biggest_window
FROM UserVisits_cte
GROUP BY user_id
ORDER BY user_id
