-- Write your PostgreSQL query statement below
WITH account_cate AS(
    SELECT account_id, 
        CASE
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income >= 20000 AND income <= 50000 THEN 'Average Salary'
            WHEN income > 50000 THEN 'High Salary'
            ELSE NULL
        END AS category
    FROM Accounts
),

-- initial category table
init_cate AS(
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
)

SELECT ic.category, COALESCE(accounts_count, 0) AS accounts_count
FROM init_cate ic
LEFT JOIN (
    SELECT category, COUNT(*) AS accounts_count
    FROM account_cate
    GROUP BY category) cate
ON ic.category = cate.category

