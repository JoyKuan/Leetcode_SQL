-- Write your PostgreSQL query statement below
WITH Low_Salary AS(
    SELECT 'Low Salary' AS category, 
        SUM(CASE WHEN income < 20000 THEN 1 ELSE 0 END) AS accounts_count
    FROM Accounts
),

Avg_Salary AS(
    SELECT 'Average Salary' AS category, 
        SUM(CASE WHEN income >= 20000 AND income <= 50000 THEN 1 ELSE 0 END) AS accounts_count
    FROM Accounts
),

High_Salary AS(
    SELECT 'High Salary' AS category, 
        SUM(CASE WHEN income > 50000 THEN 1 ELSE 0 END) AS accounts_count
    FROM Accounts
)


SELECT * FROM Low_Salary
UNION ALL 
SELECT * FROM Avg_Salary
UNION ALL 
SELECT * FROM High_Salary
