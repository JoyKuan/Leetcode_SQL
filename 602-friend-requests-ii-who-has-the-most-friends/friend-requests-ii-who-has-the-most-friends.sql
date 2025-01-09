-- Write your PostgreSQL query statement below
WITH CTE AS(
    SELECT requester_id, accepter_id FROM RequestAccepted
    UNION
    SELECT accepter_id AS requester_id, requester_id AS accepter_id FROM RequestAccepted

)

SELECT requester_id AS id, COUNT(*) AS num
FROM CTE
GROUP BY requester_id
ORDER BY COUNT(*) DESC
LIMIT 1







