-- Write your PostgreSQL query statement below
-- select max(salary) AS SecondHighestSalary
-- from (
--     select salary, dense_rank() over(order by salary desc) AS rnk
--     from Employee
-- )
-- where rnk = 2


select NULLIF(
    (select distinct salary 
    from Employee
    order by salary desc
    limit 1 offset 1)
    ,null) AS SecondHighestSalary


