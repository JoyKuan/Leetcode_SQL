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



















-- UNPIVOT_CTE:
-- | contest_id | user_id | medal |
-- | ---------- | ------- | ----- |
-- | 190        | 1       | g     |
-- | 193        | 1       | g     |
-- | 195        | 1       | b     |
-- | 196        | 1       | g     |
-- | 190        | 2       | b     |
-- | 191        | 2       | g     |
-- | 192        | 2       | s     |
-- | 194        | 2       | b     |
-- | 195        | 2       | s     |
-- | 196        | 2       | b     |
-- | 191        | 3       | s     |
-- | 192        | 3       | b     |
-- | 193        | 3       | s     |
-- | 194        | 4       | g     |
-- | 195        | 4       | g     |
-- | 190        | 5       | s     |
-- | 191        | 5       | b     |
-- | 192        | 5       | g     |
-- | 193        | 5       | b     |
-- | 194        | 5       | s     |
-- | 196        | 5       | s     |


-- interview_candidates
-- | contest_id | user_id | medal | gold_cnt | cohort |
-- | ---------- | ------- | ----- | -------- | ------ |
-- | 190        | 1       | g     | 3        | 189    |
-- | 193        | 1       | g     | 3        | 191    |
-- | 195        | 1       | b     | 3        | 192    |
-- | 196        | 1       | g     | 3        | 192    |
-- | 190        | 2       | b     | 1        | 189    |
-- | 191        | 2       | g     | 1        | 189    |
-- | 192        | 2       | s     | 1        | 189    |
-- | 194        | 2       | b     | 1        | 190    |
-- | 195        | 2       | s     | 1        | 190    |
-- | 196        | 2       | b     | 1        | 190    |
-- | 191        | 3       | s     | 0        | 190    |
-- | 192        | 3       | b     | 0        | 190    |
-- | 193        | 3       | s     | 0        | 190    |
-- | 194        | 4       | g     | 2        | 193    |
-- | 195        | 4       | g     | 2        | 193    |
-- | 190        | 5       | s     | 1        | 189    |
-- | 191        | 5       | b     | 1        | 189    |
-- | 192        | 5       | g     | 1        | 189    |
-- | 193        | 5       | b     | 1        | 189    |
-- | 194        | 5       | s     | 1        | 189    |
-- | 196        | 5       | s     | 1        | 190    |