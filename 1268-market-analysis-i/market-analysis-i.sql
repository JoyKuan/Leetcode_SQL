-- Write your PostgreSQL query statement below
WITH orders_cte AS(
    SELECT buyer_id, COUNT(*) AS orders_in_2019
    FROM Orders
    WHERE EXTRACT(YEAR FROM order_date) = '2019'
    GROUP BY buyer_id
)

SELECT u.user_id AS buyer_id, join_date, 
    COALESCE(orders_in_2019, 0) AS orders_in_2019
FROM Users u
LEFT JOIN orders_cte o ON u.user_id = o.buyer_id
