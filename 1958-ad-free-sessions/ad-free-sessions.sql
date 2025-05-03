-- Write your PostgreSQL query statement below
SELECT session_id
FROM Playback p
WHERE NOT EXISTS (
    SELECT 1
    FROM Ads a
    WHERE p.customer_id = a.customer_id AND timestamp >= start_time AND timestamp<=end_time
)