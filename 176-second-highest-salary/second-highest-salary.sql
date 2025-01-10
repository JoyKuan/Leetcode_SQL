-- Write your PostgreSQL query statement below
-- WITH CTE AS(
    
-- )

SELECT MAX(salary) AS SecondHighestSalary
FROM (SELECT id, salary,
    DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
    FROM Employee)
WHERE rnk=2
