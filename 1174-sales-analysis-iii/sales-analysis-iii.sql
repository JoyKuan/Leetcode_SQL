-- Write your PostgreSQL query statement below
SELECT p.product_id, product_name
FROM Product p
JOIN (
    SELECT product_id
    FROM Sales
    GROUP BY product_id
    HAVING MIN(sale_date) >= '2019-01-01' AND MAX(sale_date) <= '2019-03-31'
) s ON p.product_id = s.product_id



