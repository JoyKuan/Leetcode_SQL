-- Write your PostgreSQL query statement below
with only_department as(
    select employee_id
    from Employee
    group by employee_id
    having count(*) = 1
)

select employee_id, department_id
from Employee
where primary_flag ='Y' OR employee_id IN (select * from only_department)