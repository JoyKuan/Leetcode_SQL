-- Write your PostgreSQL query statement below
WITH duration AS(
    SELECT 
        employee_id,
        SUM(CEIL(EXTRACT(EPOCH FROM out_time - in_time) / 60)) AS worked_minutes
    FROM Logs
    GROUP BY employee_id
)

SELECT e.employee_id
FROM Employees e
LEFT JOIN duration d ON e.employee_id = d.employee_id
WHERE COALESCE(worked_minutes / 60, 0) < needed_hours

