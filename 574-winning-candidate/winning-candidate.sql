-- Write your PostgreSQL query statement below
-- SELECT name
-- FROM Candidate c
-- JOIN (
--     SELECT candidateId
--     FROM Vote
--     GROUP BY candidateId
--     ORDER BY COUNT(*) DESC
--     LIMIT 1
-- ) v ON c.id=v.candidateId


SELECT name
FROM Candidate c
WHERE id = (
    SELECT candidateId
    FROM Vote
    GROUP BY candidateId
    ORDER BY COUNT(*) DESC
    LIMIT 1
)
    


