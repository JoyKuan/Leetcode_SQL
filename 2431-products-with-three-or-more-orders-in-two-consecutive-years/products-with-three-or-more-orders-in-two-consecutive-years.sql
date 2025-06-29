-- Write your PostgreSQL query statement below
WITH order_cte AS(
    SELECT product_id, EXTRACT(YEAR FROM purchase_date) AS year, COUNT(*) AS cnt
    FROM Orders
    GROUP BY product_id, year
    HAVING COUNT(*) >= 3
),
consecutive_cte AS(
    SELECT 
        product_id,
        year,
        LAG(year) OVER(PARTITION BY product_id ORDER BY year) AS prev_year
    FROM order_cte
)

SELECT DISTINCT(product_id)
FROM consecutive_cte
WHERE prev_year = (year-1)



