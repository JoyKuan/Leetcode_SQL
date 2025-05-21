-- Write your PostgreSQL query statement below
WITH rank_activity AS(
    SELECT activity, COUNT(*) AS cnt
    FROM Friends
    GROUP BY activity
)

SELECT activity
FROM rank_activity
WHERE cnt NOT IN (SELECT max(cnt) FROM rank_activity) AND cnt NOT IN (SELECT min(cnt) FROM rank_activity)