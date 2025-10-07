-- Write your PostgreSQL query statement below
-- unique visited date because table has duplicated date
with deduplicated_visited_date AS(
    select visited_on, sum(amount) AS amount
    from Customer
    group by visited_on
)

select
    visited_on,
    sum(amount) over(order by visited_on rows between 6 preceding and current row) AS amount,
    round(avg(amount) over(order by visited_on rows between 6 preceding and current row),2) AS average_amount
from deduplicated_visited_date
order by visited_on 
OFFSET 6