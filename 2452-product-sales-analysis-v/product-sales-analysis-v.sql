-- Write your PostgreSQL query statement below
SELECT
    user_id,
    SUM(quantity*price) AS spending
FROM Sales
LEFT JOIN Product ON Sales.product_id=Product.product_id
GROUP BY user_id
ORDER BY spending DESC, user_id ASC
