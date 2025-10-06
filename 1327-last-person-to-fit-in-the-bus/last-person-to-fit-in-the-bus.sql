-- Write your PostgreSQL query statement below
select person_name
from (
    select *,
        SUM(weight) OVER(ORDER BY turn) AS cum_weight
    from Queue   
)
where cum_weight <= 1000
order by cum_weight desc
limit 1


