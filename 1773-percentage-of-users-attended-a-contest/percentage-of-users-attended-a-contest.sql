-- Write your PostgreSQL query statement below
select contest_id,
    ROUND(count(user_id)*100 / (select count(*) from Users)::decimal, 2) AS percentage
from Register r
group by contest_id
order by percentage desc, contest_id

