-- Write your PostgreSQL query statement below
SELECT user_id
FROM emails e
LEFT JOIN texts t ON e.email_id = t.email_id
WHERE signup_action = 'Verified' AND action_date::date = signup_date::date + 1
ORDER BY user_id