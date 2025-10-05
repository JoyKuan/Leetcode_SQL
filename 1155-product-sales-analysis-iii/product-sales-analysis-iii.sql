-- Write your PostgreSQL query statement below
with first_year_cte as(
    select product_id, min(year) as first_year
    from Sales
    group by product_id
)

select s.product_id, first_year, quantity, price
from Sales s
left join first_year_cte f on s.product_id = f.product_id
where year = first_year