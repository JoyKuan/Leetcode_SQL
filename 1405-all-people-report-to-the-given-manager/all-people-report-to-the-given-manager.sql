-- Write your PostgreSQL query statement below
with recursive cte as (select employee_id from employees where employee_id=1
                        UNION
                        select e.employee_id
                        from employees e join cte c on e.manager_id = c.employee_id
                        )
select * from cte
where employee_id!=1

