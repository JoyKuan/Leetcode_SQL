-- Write your PostgreSQL query statement below
SELECT SUBSTRING(email FROM '\w+@(\w+\.com)') AS email_domain, COUNT(*) AS count
FROM Emails
GROUP BY SUBSTRING(email FROM '\w+@(\w+\.com)')
HAVING SUBSTRING(email FROM '\w+@(\w+\.com)') IS NOT NULL
ORDER BY SUBSTRING(email FROM '\w+@(\w+\.com)')