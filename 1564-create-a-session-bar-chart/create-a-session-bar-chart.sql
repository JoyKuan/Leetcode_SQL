-- Write your PostgreSQL query statement below
SELECT
    '[0-5>' AS bin, SUM(CASE WHEN duration/60 >=0 AND duration/60 <5 THEN 1 ELSE 0 END) AS total
FROM Sessions
UNION ALL
SELECT
    '[5-10>' AS bin, SUM(CASE WHEN duration/60 >=5 AND duration/60 <10 THEN 1 ELSE 0 END) AS total
FROM Sessions
UNION ALL
SELECT
    '[10-15>' AS bin, SUM(CASE WHEN duration/60 >=10 AND duration/60 <15 THEN 1 ELSE 0 END) AS total
FROM Sessions
UNION ALL
SELECT
    '15 or more' AS bin, SUM(CASE WHEN duration/60 >=15 THEN 1 ELSE 0 END) AS total
FROM Sessions




-- SELECT
--     CASE
--         WHEN duration/60 >=0 AND duration/60 <5 THEN '[0-5>'
--         WHEN duration/60 >5 AND duration/60 <10 THEN '[5-10>'
--         WHEN duration/60 >=10 AND duration/60 <15 THEN '[10-15>'
--         ELSE '15 minutes or more'
--     END AS bin,
--     COUNT(*) AS total
-- FROM Sessions
-- GROUP BY bin
