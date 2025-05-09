-- Write your PostgreSQL query statement below
SELECT SUBSTRING(email FROM '@(.*)$') AS email_domain, COUNT(email) AS count
FROM Emails
WHERE email ~ '^.*?@.*\.com$'
GROUP BY email_domain
ORDER BY email_domain