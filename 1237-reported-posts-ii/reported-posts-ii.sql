-- Write your PostgreSQL query statement below
with cte as (
    select
        action_date,
        round(100 * (count(distinct post_id) filter (where remove_date is not null and extra = 'spam'))::numeric / count(distinct post_id) filter (where extra = 'spam'),2) as daily_pct
    from (
        select
            a.post_id,
            action,
            extra,
            action_date,
            remove_date
        from actions a
        left join removals r on a.post_id in (r.post_id)
    ) a
    group by 1
    having (count(extra) filter (where extra = 'spam')) > 0
    order by action_date
)

select
  round(sum(daily_pct)::numeric/count(*),2) as average_daily_percent
from cte

-- WITH spam_reports AS(
--     SELECT 
--         action_date, 
--         COUNT(DISTINCT post_id) AS total_spam_posts,
--         SUM(CASE WHEN post_id IN (SELECT post_id FROM Removals WHERE remove_date IS NOT NULL) THEN 1 ELSE 0 END) AS removed_spam_posts
--     FROM Actions
--     WHERE action='report' AND extra='spam'
--     GROUP BY action_date
-- ),
-- daily_percent AS(
--     SELECT (removed_spam_posts * 100.0 / total_spam_posts) AS percent
--     FROM spam_reports
-- )

-- SELECT 
-- round(sum(percent)::numeric/count(*),2) as average_daily_percent
-- FROM daily_percent






-- +---------+---------+-------------+--------+--------+
-- | user_id | post_id | action_date | action | extra  |
-- +---------+---------+-------------+--------+--------+
-- | 2       | 2       | 2019-07-04  | report | spam   | 2019-07-20
-- | 3       | 4       | 2019-07-04  | report | spam   |
-- | 3       | 4       | 2019-07-04  | report | spam   |
-- | 4       | 3       | 2019-07-02  | report | spam   | 2019-07-18
-- +---------+---------+-------------+--------+--------+


