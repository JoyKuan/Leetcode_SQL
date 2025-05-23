-- Write your PostgreSQL query statement below
SELECT 
    gender, 
    day, 
    SUM(score_points) OVER(PARTITION BY gender ORDER BY day) AS total
FROM Scores
ORDER BY gender, day