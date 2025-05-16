-- Write your PostgreSQL query statement below
SELECT name
FROM Candidate c
JOIN (
    SELECT candidateId, COUNT(*) AS cnt
    FROM Vote
    GROUP BY candidateId
    ORDER BY COUNT(*) DESC
    LIMIT 1
) v ON c.id=v.candidateId

