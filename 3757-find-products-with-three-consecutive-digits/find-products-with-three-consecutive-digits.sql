-- Write your PostgreSQL query statement below
SELECT product_id, name
FROM products
WHERE name ~ '.*(?<!\d)\d{3}(?!\d).*'
ORDER BY product_id
