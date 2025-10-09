-- Write your PostgreSQL query statement below
select 
    user_id,
    max(next_date - visit_date) AS biggest_window
from (
    select user_id, visit_date,
        LEAD(visit_date, 1, '2021-1-1'::date) over(partition by user_id order by visit_date) AS next_date
    from UserVisits
)
group by user_id










-- +---------+------------+
-- | user_id | visit_date | LEAD(visit_date)
-- +---------+------------+
-- | 1       | 2020-10-20 |2020-11-28
-- | 1       | 2020-11-28 |2020-12-3 
-- | 1       | 2020-12-3  | null  '2021-1-1'
-- | 2       | 2020-10-5  |2020-12-9
-- | 2       | 2020-12-9  |null  '2021-1-1'
-- | 3       | 2020-11-11 |
-- +---------+------------+