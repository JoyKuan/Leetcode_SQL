-- Write your PostgreSQL query statement below
SELECT session_id
FROM Playback
WHERE session_id NOT IN (
    SELECT session_id
    FROM Playback p
    LEFT JOIN Ads a ON p.customer_id = a.customer_id
    WHERE timestamp >= start_time AND timestamp<=end_time
)




