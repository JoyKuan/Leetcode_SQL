-- Write your PostgreSQL query statement below
WITH agg_sales AS (
    SELECT user_id, product_id, SUM(quantity) AS total_quantity
    FROM Sales s
    GROUP BY user_id, product_id
),
total_price AS(
    SELECT user_id, s.product_id,
        RANK() OVER(PARTITION BY user_id ORDER BY total_quantity*price DESC) AS rnk
    FROM agg_sales s
    JOIN Product p ON s.product_id = p.product_id
)

SELECT user_id, product_id
FROM total_price
WHERE rnk = 1




