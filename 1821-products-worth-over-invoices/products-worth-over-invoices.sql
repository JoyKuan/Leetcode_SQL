-- Write your PostgreSQL query statement below
SELECT 
    name,
    COALESCE(rest, 0) AS rest,
    COALESCE(paid, 0) AS paid,
    COALESCE(canceled, 0) AS canceled,
    COALESCE(refunded, 0) AS refunded
FROM Product p
LEFT JOIN (
    SELECT 
        product_id,
        SUM(rest) AS rest,
        SUM(paid) AS paid,
        SUM(canceled) AS canceled,
        SUM(refunded) AS refunded
    FROM Invoice i
    GROUP BY product_id
) i ON i.product_id = p.product_id
ORDER BY name


