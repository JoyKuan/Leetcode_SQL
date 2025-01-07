-- Write your PostgreSQL query statement below
WITH Low_Salary AS(
    SELECT 'Low Salary' AS category, COUNT(*) AS accounts_count
    FROM Accounts
    WHERE income < 20000
),

Avg_Salary AS(
    SELECT 'Average Salary' AS category, COUNT(*) AS accounts_count
    FROM Accounts
    WHERE income >= 20000 AND income <= 50000
),

High_Salary AS(
    SELECT 'High Salary' AS category, COUNT(*) AS accounts_count
    FROM Accounts
    WHERE income > 50000
)


SELECT * FROM Low_Salary
UNION ALL 
SELECT * FROM Avg_Salary
UNION ALL 
SELECT * FROM High_Salary
