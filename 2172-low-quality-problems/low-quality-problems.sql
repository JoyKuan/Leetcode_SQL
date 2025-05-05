-- Write your PostgreSQL query statement below
SELECT problem_id
FROM Problems
WHERE likes*100.0 / (likes + dislikes) < 60
ORDER BY problem_id
