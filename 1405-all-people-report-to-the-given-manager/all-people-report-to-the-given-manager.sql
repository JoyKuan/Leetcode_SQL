-- Write your PostgreSQL query statement below
select e.employee_id AS employee_id
from Employees e, Employees e1, Employees e2
where e.manager_id = e1.employee_id AND e1.manager_id = e2.employee_id AND e.employee_id != 1 AND e2.manager_id = 1



-- +-------------+---------------+------------+
-- | employee_id | employee_name | manager_id |employee_id | employee_name | manager_id | employee_id | employee_name | manager_id |
-- +-------------+---------------+------------+
-- | 1           | Boss          | 1          |1           | Boss          | 1          |1           | Boss          | 1          |
-- | 3           | Alice         | 3          |3           | Alice         | 3          |3           | Alice         | 3          |
-- | 4           | Daniel        | 2          |2           | Bob           | 1          |1           | Boss          | 1          |
-- | 7           | Luis          | 4          |4           | Daniel        | 2          |2           | Bob           | 1          |
-- | 8           | Jhon          | 3          |3           | Alice         | 3          |3           | Alice         | 3          |
-- | 9           | Angela        | 8          |8           | Jhon          | 3          |3           | Alice         | 3          |
-- | 2           | Bob           | 1          |1           | Boss          | 1          |1           | Boss          | 1          |
-- | 77          | Robert        | 1          |1           | Boss          | 1          |1           | Boss          | 1          |
-- +-------------+---------------+------------+