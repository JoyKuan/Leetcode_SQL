-- Write your PostgreSQL query statement below
WITH cum_sum AS(
    SELECT person_name,
    SUM(weight) OVER(ORDER BY turn) AS Total_Weight
    FROM Queue
)

SELECT person_name
FROM cum_sum
WHERE Total_Weight <= 1000
ORDER BY Total_Weight DESC
LIMIT 1

