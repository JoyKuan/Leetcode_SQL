-- Write your PostgreSQL query statement below
SELECT employee_id, department_id
FROM (
  SELECT employee_id, department_id, primary_flag,
         COUNT(*) OVER (PARTITION BY employee_id) AS cnt
  FROM employee
) t
WHERE primary_flag = 'Y' OR cnt = 1;