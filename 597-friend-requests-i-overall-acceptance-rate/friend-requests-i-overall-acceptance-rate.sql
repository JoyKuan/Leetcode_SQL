-- Write your PostgreSQL query statement below
WITH RA AS(
    SELECT DISTINCT requester_id, accepter_id FROM RequestAccepted
),
FR AS(
    SELECT DISTINCT sender_id, send_to_id FROM FriendRequest
)

-- The divisor (total number of requests) could be '0' if the table friend_request is empty


SELECT 
ROUND(
    COALESCE((SELECT COUNT(*) FROM RA)::DECIMAL / NULLIF((SELECT COUNT(*) FROM FR), 0), 0), 2) AS accept_rate

