with cte as(
    select fail_date AS status_date, 'failed' AS period_state from Failed where extract(year from fail_date) = '2019'
    union all
    select success_date AS status_date, 'succeeded' AS period_state from Succeeded where extract(year from success_date) = '2019' 
),

cte2 as(
    select status_date, period_state, 
        row_number() over(partition by period_state order by status_date) as rn
    from cte
)

select period_state, min(status_date) AS start_date, max(status_date) AS end_date
from cte2
group by period_state, status_date - interval '1 day'*rn
order by start_date


