-- Write your PostgreSQL query statement below
select e2.name AS name
from Employee e1
inner join Employee e2 on e1.managerId = e2.id
group by e2.id, e2.name
HAVING COUNT(*) >=5


