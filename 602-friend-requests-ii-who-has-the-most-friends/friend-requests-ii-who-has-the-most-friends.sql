-- Write your PostgreSQL query statement below
with friends_cte AS(
    select requester_id as id from RequestAccepted
    union all
    select accepter_id as id from RequestAccepted
)

select id, count(*) AS num
from friends_cte
group by id
order by count(*) desc
limit 1