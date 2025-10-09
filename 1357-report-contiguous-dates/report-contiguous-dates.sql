-- Write your PostgreSQL query statement below
with cte as(
    select fail_date as task_date, 'failed' AS period_state from Failed
    union
    select success_date as task_date, 'succeeded' AS period_state from Succeeded
),

cte2 as(
    select *, row_number() over(partition by period_state order by task_date) as rn
    from cte
    where EXTRACT(YEAR from task_date) = '2019'
)

select period_state, min(task_date) AS start_date, max(task_date) AS end_date
from cte2
group by period_state, task_date - interval '1 days' * rn
order by start_date




-- | task_date  | period_state | rn | task_date - interval 'rn days'
-- | ---------- | ------------ | -- | -------------------------------
-- | 2019-01-04 | failed       | 1  | 2019-01-03
-- | 2019-01-05 | failed       | 2  | 2019-01-03
-- | 2019-01-01 | succeeded    | 1  | 2018-12-31
-- | 2019-01-02 | succeeded    | 2  | 2018-12-31
-- | 2019-01-03 | succeeded    | 3  | 2018-12-31
-- | 2019-01-06 | succeeded    | 4  | 2019-01-02