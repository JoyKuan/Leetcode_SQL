-- Write your PostgreSQL query statement below
SELECT SUBSTRING(email FROM '@(\w+\.com)') AS email_domain, COUNT(email) AS count
FROM Emails
WHERE email ~ '@(\w+\.com)'
GROUP BY email_domain
ORDER BY email_domain