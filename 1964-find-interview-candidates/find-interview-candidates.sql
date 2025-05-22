-- Write your PostgreSQL query statement below
WITH UNPIVOT_CTE AS(
    SELECT contest_id, user_id, medal
    FROM Contests
    CROSS JOIN LATERAL(
        VALUES
        (gold_medal, 'g'),
        (silver_medal, 's'),
        (bronze_medal, 'b')
    ) AS t(user_id, medal)
    ORDER BY user_id, contest_id, medal
),

interview_candidates AS(
    SELECT 
        contest_id, user_id, medal,
        sum((medal = 'g')::int) OVER(PARTITION BY user_id) AS gold_cnt,
        contest_id - ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY contest_id) as cohort
    FROM UNPIVOT_CTE
)


SELECT distinct name, mail 
FROM interview_candidates ic
INNER JOIN Users u ON ic.user_id = u.user_id
GROUP BY ic.user_id, mail, name, gold_cnt, cohort
HAVING gold_cnt >= 3 OR COUNT(medal) >= 3

