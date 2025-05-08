-- Write your PostgreSQL query statement below
-- SELECT 
--     u.user_id, 
--     name, 
--     COALESCE(dist, 0) AS "traveled distance"
-- FROM Users u
-- LEFT JOIN (
--     SELECT user_id, SUM(distance) AS dist
--     FROM Rides
--     GROUP BY user_id
-- ) r ON u.user_id = r.user_id
-- ORDER BY u.user_id 

SELECT 
    u.user_id, name, 
    COALESCE(SUM(distance), 0) AS "traveled distance"
FROM Users u
LEFT JOIN Rides r ON u.user_id = r.user_id
GROUP BY u.user_id, name
ORDER BY u.user_id 
