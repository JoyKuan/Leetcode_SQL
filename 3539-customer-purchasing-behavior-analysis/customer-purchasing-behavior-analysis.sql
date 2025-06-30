-- Write your PostgreSQL query statement below
WITH trans_prod_cte AS(
    SELECT transaction_id, customer_id, transaction_date, amount, price, category
    FROM Transactions t
    JOIN Products p ON t.product_id = p.product_id
),
cate_freq AS(
    SELECT
        customer_id,
        transaction_date,
        category,
        COUNT(*) OVER (PARTITION BY customer_id, category) AS category_count
    FROM trans_prod_cte
),
cate_freq_rank AS(
    SELECT
        customer_id,
        category,
        RANK() OVER(PARTITION BY customer_id ORDER BY category_count DESC, transaction_date DESC) AS rnk
    FROM cate_freq
),
agg_cte AS(
    SELECT
        customer_id,
        ROUND(SUM(amount),2) AS total_amount,
        COUNT(transaction_id) AS transaction_count,
        COUNT(DISTINCT category) AS unique_categories,
        ROUND(AVG(amount),2) AS avg_transaction_amount,
        ROUND((COUNT(transaction_id)*10) + (SUM(amount)*1.0/100),2) AS loyalty_score
    FROM trans_prod_cte
    GROUP BY customer_id
)

SELECT 
    ag.customer_id, 
    total_amount,
    transaction_count,
    unique_categories,
    avg_transaction_amount,
    category AS top_category,
    loyalty_score
FROM agg_cte ag
JOIN cate_freq_rank cfr ON ag.customer_id = cfr.customer_id AND rnk=1
ORDER BY loyalty_score DESC, customer_id









-- cate_freq
-- | customer_id | transaction_date | category | category_count |
-- | ----------- | ---------------- | -------- | -------------- |
-- | 101         | 2023-01-01       | A        | 1              |
-- | 101         | 2023-01-15       | B        | 1              |
-- | 101         | 2023-02-10       | C        | 1              |
-- | 102         | 2023-01-01       | A        | 1              |
-- | 102         | 2023-01-22       | C        | 1              |