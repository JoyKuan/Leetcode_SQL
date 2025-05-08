-- Write your PostgreSQL query statement below
SELECT
    MAX(salary) - MIN(salary) AS salary_difference
FROM (
    SELECT department, MAX(salary) AS salary
    FROM Salaries
    WHERE department IN ('Engineering', 'Marketing')
    GROUP BY department
)


