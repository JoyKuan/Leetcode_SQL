-- Write your PostgreSQL query statement below
select 
distinct 
e3.employee_id

from 
Employees e1 
join Employees e2 on e1.employee_id=e2.manager_id
join Employees e3 on e2.employee_id=e3.manager_id
where e1.manager_id=1 and e3.employee_id<>1

