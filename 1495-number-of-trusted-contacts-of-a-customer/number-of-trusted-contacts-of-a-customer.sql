-- Write your PostgreSQL query statement below
WITH trust_cnt AS(
    SELECT
        user_id,
        SUM(CASE WHEN contact_name IN (SELECT customer_name FROM Customers) THEN 1 ELSE 0 END) AS trusted_contacts_cnt
    FROM Contacts
    GROUP BY user_id
)



SELECT invoice_id,c.customer_name, price, COALESCE(contacts_cnt, 0) AS contacts_cnt, COALESCE(trusted_contacts_cnt, 0) AS trusted_contacts_cnt
FROM Invoices i
INNER JOIN Customers c ON i.user_id = c.customer_id
LEFT JOIN (
    SELECT user_id, COUNT(*) AS contacts_cnt
    FROM Contacts
    GROUP BY user_id
) c2 ON i.user_id = c2.user_id
LEFT JOIN trust_cnt tc ON i.user_id = tc.user_id
ORDER BY invoice_id