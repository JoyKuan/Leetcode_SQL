-- Write your PostgreSQL query statement below
-- select round(avg(average_daily_percent*100),2) as average_daily_percent
-- from (
-- select action_date,(count(distinct case when r.post_id is not null then r.post_id end)*1.0)/count(distinct a.post_id ) as average_daily_percent
-- from Actions A 
    -- left join removals r on a.post_id=r.post_id
-- where action='report' and extra='spam'
-- group by 1
-- )

WITH deduplicate_report AS (
    SELECT DISTINCT action_date, post_id
    FROM Actions
    WHERE action = 'report' AND extra = 'spam'
),
spam_reports AS(
    SELECT 
        action_date, 
        COUNT(post_id) AS total_spam_posts,
        SUM(CASE WHEN post_id IN (SELECT post_id FROM Removals WHERE remove_date IS NOT NULL) THEN 1 ELSE 0 END) AS removed_spam_posts
    FROM deduplicate_report
    GROUP BY action_date
),
daily_percent AS(
    SELECT (removed_spam_posts * 100.0 / total_spam_posts) AS percent
    FROM spam_reports
)

SELECT round(sum(percent)*1.0/count(*),2) as average_daily_percent
FROM daily_percent






-- +---------+---------+-------------+--------+--------+
-- | user_id | post_id | action_date | action | extra  |
-- +---------+---------+-------------+--------+--------+
-- | 2       | 2       | 2019-07-04  | report | spam   | 2019-07-20
-- | 3       | 4       | 2019-07-04  | report | spam   |
-- | 3       | 4       | 2019-07-04  | report | spam   |
-- | 4       | 3       | 2019-07-02  | report | spam   | 2019-07-18
-- +---------+---------+-------------+--------+--------+


