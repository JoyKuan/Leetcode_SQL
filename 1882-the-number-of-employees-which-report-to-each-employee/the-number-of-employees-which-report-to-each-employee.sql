-- Write your PostgreSQL query statement below
select e2.employee_id, e2.name, count(*) AS reports_count, round(AVG(e1.age)) AS average_age
from Employees e1, Employees e2
where e1.reports_to = e2.employee_id
group by e2.employee_id, e2.name
order by e2.employee_id
