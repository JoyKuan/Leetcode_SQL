-- Write your PostgreSQL query statement below
WITH high_earner AS(
    SELECT name AS Employee, salary AS Salary, departmentId,
    DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS rnk
    FROM Employee
)
 
SELECT d.name AS Department, Employee, Salary
FROM Department d
RIGHT JOIN (SELECT * FROM high_earner WHERE rnk IN (1,2,3)) top3 ON top3.departmentId = d.id
