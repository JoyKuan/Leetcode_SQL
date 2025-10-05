-- Write your PostgreSQL query statement below
select machine_id,
    ROUND((SUM(case when activity_type='start' then timestamp*(-1) else timestamp end) / COUNT(distinct process_id))::numeric, 3) AS processing_time
from Activity
group by machine_id
