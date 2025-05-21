-- Write your PostgreSQL query statement below
WITH rank_activity AS(
    SELECT 
        activity, 
        COUNT(*) AS cnt, 
        MAX(COUNT(*)) OVER () AS cnt_max,
        MIN(COUNT(*)) OVER () AS cnt_min
    FROM Friends
    GROUP BY activity
)

SELECT activity
FROM rank_activity
WHERE cnt NOT IN (cnt_min, cnt_max)