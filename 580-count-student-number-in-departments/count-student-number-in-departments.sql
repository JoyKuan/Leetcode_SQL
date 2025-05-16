-- Write your PostgreSQL query statement below
SELECT
    dept_name, COALESCE(student_number,0) AS student_number
FROM Department d
LEFT JOIN (
    SELECT dept_id, COUNT(*) AS student_number
    FROM Student
    GROUP BY dept_id
) s ON d.dept_id = s.dept_id
ORDER BY student_number DESC, dept_name 

