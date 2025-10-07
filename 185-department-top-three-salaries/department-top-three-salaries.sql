-- Write your PostgreSQL query statement below
select d.name AS Department, e.name AS Employee, salary AS Salary
from (
    select name, salary, departmentId,
    dense_rank() over(partition by departmentId order by salary desc) AS rnk
    from Employee
) e
left join Department d on e.departmentId = d.id
where rnk <=3