-- Write your PostgreSQL query statement below
select activity_date AS day, count(distinct user_id) AS active_users
from Activity a
where activity_date between '2019-07-27'::date-interval '29 days' AND '2019-07-27'
group by activity_date