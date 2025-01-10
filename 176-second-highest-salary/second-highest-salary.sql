-- Write your PostgreSQL query statement below
WITH CTE AS(
    SELECT id, salary,
    DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
    FROM Employee
)

SELECT MAX(salary) AS SecondHighestSalary
FROM CTE
WHERE rnk=2
