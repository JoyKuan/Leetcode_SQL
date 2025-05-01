-- Write your PostgreSQL query statement below
WITH parent_cte AS(
    SELECT parent_id, COUNT(DISTINCT sub_id) AS cnt
    FROM Submissions
    GROUP BY parent_id
),

post_cte AS(
    SELECT sub_id
    FROM Submissions
    WHERE parent_id IS NULL
    GROUP BY sub_id
)

SELECT sub_id AS post_id, 
    COALESCE(cnt, 0) AS number_of_comments
FROM post_cte t1
LEFT JOIN parent_cte t2 ON t1.sub_id = t2.parent_id
