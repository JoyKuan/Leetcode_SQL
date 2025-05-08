-- Write your PostgreSQL query statement below
SELECT bike_number, end_time
FROM (
    SELECT 
    *,
    ROW_NUMBER() OVER(PARTITION BY bike_number ORDER BY end_time DESC) rnk
    FROM Bikes
)
WHERE rnk=1
ORDER BY end_time DESC


