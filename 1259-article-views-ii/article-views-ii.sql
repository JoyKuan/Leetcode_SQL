-- Write your PostgreSQL query statement below
SELECT DISTINCT viewer_id AS id
FROM (
    SELECT view_date, viewer_id
    FROM Views
    GROUP BY view_date, viewer_id
    HAVING COUNT(DISTINCT article_id) > 1
) AS subqc
ORDER BY id


