-- Write your PostgreSQL query statement below
WITH first_cte AS(
    SELECT
        first_col,
        ROW_NUMBER() OVER(ORDER BY first_col ASC) AS id
    FROM Data
),
second_cte AS(
    SELECT
        second_col,
        ROW_NUMBER() OVER(ORDER BY second_col DESC) AS id
    FROM Data
)

SELECT first_col, second_col
FROM first_cte f
INNER JOIN second_cte s ON f.id = s.id