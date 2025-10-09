-- Write your PostgreSQL query statement below
select max(salary) AS SecondHighestSalary
from (
    select salary, dense_rank() over(order by salary desc) AS rnk
    from Employee
)
where rnk = 2


