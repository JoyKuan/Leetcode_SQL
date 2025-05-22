-- Write your PostgreSQL query statement below
WITH detail_UserVisits AS(
    SELECT
        user_id,
        visit_date,
        COALESCE(LEAD(visit_date, 1) OVER(PARTITION BY user_id ORDER BY visit_date), '2021-1-1'::DATE) AS next_day
    FROM UserVisits
)

SELECT user_id, MAX(next_day - visit_date) AS biggest_window
FROM detail_UserVisits
GROUP BY user_id
