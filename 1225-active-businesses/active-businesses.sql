-- Write your PostgreSQL query statement below
WITH avg_activity AS(
    SELECT event_type, AVG(occurrences) AS avg
    FROM Events
    GROUP BY event_type
)

SELECT business_id
FROM Events e
JOIN avg_activity a ON e.event_type = a.event_type AND e.occurrences > a.avg
GROUP BY business_id
HAVING COUNT(e.event_type) > 1
-- HAVING SUM(CASE WHEN occurrences > avg THEN 1 ELSE 0 END) > 1