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



-- +----------+-------------+------------+
-- | order_id | customer_id | order_type | rnk
-- +----------+-------------+------------+
-- | 1        | 1           | 0          | 1
-- | 2        | 1           | 0          | 1
-- | 11       | 2           | 0          | 1
-- | 12       | 2           | 1          | 2
-- | 22       | 3           | 0          | 1
-- | 21       | 3           | 1          | 2
-- | 31       | 4           | 1          | 1
-- | 32       | 4           | 1          | 1
-- +----------+-------------+------------+


-- | 1        | 1           | 0          | 1
-- | 2        | 1           | 0          | 1
-- | 11       | 2           | 0          | 1
-- | 22       | 3           | 0          | 1
-- | 31       | 4           | 1          | 1
-- | 32       | 4           | 1          | 1