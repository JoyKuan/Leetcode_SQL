-- Write your PostgreSQL query statement below
select e2.name as name
from Employee e1, Employee e2
where e1.managerId = e2.id
group by e2.id, e2.name
having count(*) >= 5



