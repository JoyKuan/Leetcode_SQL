-- Write your PostgreSQL query statement below
select
    s.user_id, 
    COALESCE(confirmation_rate, 0.00) AS confirmation_rate
from Signups s
left join (
    select user_id, round(SUM(CASE when action='confirmed' then 1 else 0 end) / count(*)::decimal, 2) AS confirmation_rate
    from Confirmations c
    group by user_id
) c on s.user_id = c.user_id





