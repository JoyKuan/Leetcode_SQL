-- Write your PostgreSQL query statement below
SELECT COALESCE(ROUND(AVG(cnt), 2), 0) AS average_sessions_per_user
FROM (select user_id,
    COUNT(DISTINCT session_id) AS cnt
from Activity
where activity_date between '2019-07-27'::date - INTERVAL '29 day' AND '2019-07-27'::date
group by user_id)