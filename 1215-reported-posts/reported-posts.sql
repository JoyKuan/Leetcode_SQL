-- Write your PostgreSQL query statement below
SELECT extra AS report_reason, COUNT(DISTINCT post_id) AS report_count
FROM Actions
WHERE action_date='2019-07-04' AND action = 'report'
GROUP BY extra


-- | 2       | 4       | 2019-07-04  | report | spam   |
-- | 3       | 4       | 2019-07-04  | report | spam   
-- | 5       | 2       | 2019-07-04  | report | racism |
-- | 5       | 5       | 2019-07-04  | report | racism 