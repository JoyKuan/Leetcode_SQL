-- Write your PostgreSQL query statement below
WITH orders_cte AS(
    SELECT *,
    DENSE_RANK() OVER(PARTITION BY customer_id ORDER BY order_type) AS rnk
    FROM Orders
    ORDER BY customer_id, order_type
)

SELECT order_id, customer_id, order_type
FROM orders_cte
WHERE rnk = 1



