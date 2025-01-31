# Write your MySQL query statement below
WITH CTE AS (
    SELECT project_id, COUNT(employee_id) AS cnt
    FROM Project
    GROUP BY project_id
)

SELECT project_id 
FROM CTE
WHERE cnt = (SELECT MAX(cnt) FROM CTE)
