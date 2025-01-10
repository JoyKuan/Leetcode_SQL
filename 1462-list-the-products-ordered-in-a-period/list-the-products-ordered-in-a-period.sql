-- Write your PostgreSQL query statement below
SELECT product_name, SUM(unit) AS unit
FROM Orders
LEFT JOIN Products ON Orders.product_id = Products.product_id
WHERE TO_CHAR(order_date, 'YYYY-MM') = '2020-02'
GROUP BY product_name
HAVING SUM(unit) >= 100
