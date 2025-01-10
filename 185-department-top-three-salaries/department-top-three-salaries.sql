-- Write your PostgreSQL query statement below
WITH high_earner AS(
    SELECT name AS Employee, salary AS Salary, departmentId,
    DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS rnk
    FROM Employee
)
 
SELECT d.name AS Department, Employee, Salary
FROM Department d
RIGHT JOIN high_earner h ON h.departmentId = d.id
WHERE rnk <=3
