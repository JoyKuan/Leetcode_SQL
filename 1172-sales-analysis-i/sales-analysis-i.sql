-- Write your PostgreSQL query statement below
WITH total_sales AS (
        SELECT seller_id, sum(price) AS total_sell
        FROM Sales
        GROUP BY seller_id
)

SELECT seller_id
FROM total_sales
WHERE total_sell = (SELECT MAX(total_sell) FROM total_sales);