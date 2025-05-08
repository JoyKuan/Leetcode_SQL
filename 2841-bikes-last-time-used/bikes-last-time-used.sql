-- Write your PostgreSQL query statement below
-- SELECT bike_number, end_time
-- FROM (
--     SELECT 
--     *,
--     ROW_NUMBER() OVER(PARTITION BY bike_number ORDER BY end_time DESC) rnk
--     FROM Bikes
-- )
-- WHERE rnk=1
-- ORDER BY end_time DESC


SELECT bike_number, MAX(end_time) AS end_time
FROM Bikes
GROUP BY bike_number
ORDER BY end_time DESC