-- Write your PostgreSQL query statement below
-- SELECT *
-- FROM products
-- WHERE description LIKE '%SN____-____ %' OR 
-- description LIKE '%SN____-____'
-- ORDER BY product_id


-- Write your PostgreSQL query statement below
SELECT
    *
FROM products
WHERE description ~ '\mSN\d{4}-\d{4}\M'
ORDER BY product_id ASC;