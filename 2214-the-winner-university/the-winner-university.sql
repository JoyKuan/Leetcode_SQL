-- Write your PostgreSQL query statement below

WITH nyu AS(
    SELECT COUNT(*) AS n
    FROM NewYork
    WHERE score >= 90
),
cal AS(
    SELECT COUNT(*) AS c
    FROM California
    WHERE score >= 90
)

-- cross join 
SELECT
    CASE
        WHEN n > c THEN 'New York University'
        WHEN c > n THEN 'California University'
        ELSE 'No Winner' 
    END AS winner
FROM nyu, cal


