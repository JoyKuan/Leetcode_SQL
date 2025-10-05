-- Write your PostgreSQL query statement below
-- select 
--     ROUND(COUNT(*) / (select count(distinct player_id) from Activity)::decimal, 2) AS fraction
-- from Activity a1, Activity a2
-- where a1.player_id = a2.player_id AND a2.event_date - a1.event_date = 1

with first_login as(
    select player_id, min(event_date) AS first_login_date
    from Activity
    group by player_id
)

select ROUND(count(*) / (SELECT COUNT(DISTINCT player_id) FROM Activity)::decimal, 2) AS fraction
from Activity a
left join first_login f on a.player_id = f.player_id
where a.event_date - f.first_login_date = 1

