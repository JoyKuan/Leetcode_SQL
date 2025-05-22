-- Write your PostgreSQL query statement below
SELECT p1.id AS P1, p2.id AS P2, abs(p1.x_value - p2.x_value) * abs(p1.y_value - p2.y_value) AS AREA
FROM Points p1
JOIN Points p2 ON p1.id != p2.id AND p1.id < p2.id
WHERE abs(p1.x_value - p2.x_value) * abs(p1.y_value - p2.y_value) > 0
ORDER BY AREA DESC, p1.id, p2.id