-- Write your PostgreSQL query statement below
WITH first_logins AS
(
    SELECT 
        activity_date, activity, user_id,
        RANK() OVER (PARTITION BY user_id ORDER BY activity_date ASC) AS rnk
    FROM Traffic
    WHERE activity='login'
)

SELECT activity_date AS login_date, COUNT(DISTINCT user_id) AS user_count
FROM first_logins
WHERE rnk = 1 AND activity_date BETWEEN '2019-06-30'::date - INTERVAL '90 days' AND '2019-06-30'::date
GROUP BY activity_date





-- +---------+----------+---------------+
-- | user_id | activity | activity_date |
-- +---------+----------+---------------+
-- | 1       | login    | 2019-05-01    |
-- | 2       | login    | 2019-06-21    |
-- | 3       | login    | 2019-01-01    |
-- | 4       | login    | 2019-06-21    |
-- | 5       | login    | 2019-03-01    |
-- | 5       | login    | 2019-06-21    |
-- +---------+----------+---------------+
