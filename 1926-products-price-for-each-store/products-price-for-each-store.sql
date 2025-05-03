-- Write your PostgreSQL query statement below
-- 快速記法（橫向 pivot）: 要把列攤平成欄，CASE + 聚合（如 MAX）+ GROUP BY
SELECT 
    product_id,
    MAX(CASE WHEN store='store1' THEN price END) AS store1,
    MAX(CASE WHEN store='store2' THEN price END) AS store2,
    MAX(CASE WHEN store='store3' THEN price END) AS store3
FROM Products
GROUP BY product_id



