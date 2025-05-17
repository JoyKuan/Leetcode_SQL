-- Write your PostgreSQL query statement below
WITH followee_CTE AS(
    SELECT followee, COUNT(follower) AS num
    FROM Follow
    GROUP BY followee
    HAVING COUNT(follower) >= 1
),
follower_CTE AS(
    SELECT follower
    FROM Follow
    WHERE follower IN (SELECT followee FROM followee_CTE)
    GROUP BY follower
    HAVING COUNT(followee) >= 1
)

SELECT followee AS follower, num
FROM followee_CTE fe
INNER JOIN follower_CTE fr ON fe.followee = fr.follower
ORDER BY follower






-- A 1
-- B 2
-- D 1

-- B 1
-- D 1
