-- Write your PostgreSQL query statement below
-- SELECT
--     emp_id,
--     firstname,
--     lastname,
--     MAX(CAST(salary AS INT)) AS salary,
--     department_id
-- FROM Salary
-- GROUP BY emp_id, firstname, lastname, department_id
-- ORDER BY emp_id



-- Method 2: 單表掃描 + 窗口函數排序
-- SELECT emp_id, firstname, lastname, salary, department_id
-- FROM (
--     SELECT *, RANK() OVER(PARTITION BY emp_id ORDER BY CAST(salary AS INT) DESC) rnk
--     FROM Salary
-- )
-- WHERE rnk=1
-- ORDER BY emp_id

-- Method 3: DISTINCT ON (ONLY PostgreSQL)
SELECT DISTINCT ON (emp_id) *
FROM Salary
ORDER BY emp_id, salary DESC



