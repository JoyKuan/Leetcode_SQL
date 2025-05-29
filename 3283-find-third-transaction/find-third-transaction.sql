-- Write your PostgreSQL query statement below
WITH rnk_cte AS(
    SELECT *, RANK() OVER(PARTITION BY user_id ORDER BY transaction_date) AS rnk
    FROM Transactions
    ORDER BY user_id, transaction_date
)

SELECT user_id, spend AS third_transaction_spend, transaction_date AS third_transaction_date
FROM rnk_cte c
WHERE rnk = 3 AND 
spend > (SELECT spend FROM rnk_cte WHERE user_id = c.user_id and rnk = 2) AND 
spend > (SELECT spend FROM rnk_cte WHERE user_id = c.user_id and rnk = 1)
