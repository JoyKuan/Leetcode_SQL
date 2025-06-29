-- Write your PostgreSQL query statement below
WITH product_season_cte AS(
    SELECT
        CASE 
            WHEN EXTRACT(MONTH FROM sale_date) IN ('12', '1', '2') THEN 'Winter' 
            WHEN EXTRACT(MONTH FROM sale_date) IN ('3', '4', '5') THEN 'Spring'
            WHEN EXTRACT(MONTH FROM sale_date) IN ('6', '7', '8') THEN 'Summer'
            WHEN EXTRACT(MONTH FROM sale_date) IN ('9', '10', '11') THEN 'Fall'
        END AS season,
        category,
        SUM(quantity) AS total_quantity,
        SUM(price*quantity*1.0) AS total_revenue

    FROM sales s
    JOIN products p ON s.product_id = p.product_id 
    GROUP BY category, season
),
popularity_season_cte AS(
    SELECT  
        *,
        RANK() OVER(PARTITION BY season ORDER BY total_quantity DESC, total_revenue DESC) AS rnk
    FROM product_season_cte
)

SELECT season, category, total_quantity, total_revenue
FROM popularity_season_cte
WHERE rnk = 1



