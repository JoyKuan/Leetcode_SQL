-- Write your PostgreSQL query statement below
with cte as(
    select
        task_id,
        generate_series(1, subtasks_count, 1) AS subtask_id
    from Tasks
)

select c.task_id, c.subtask_id
from cte c
left outer join Executed e on c.task_id = e.task_id AND c.subtask_id = e.subtask_id
where e.task_id is null AND e.subtask_id is null





-- | task_id | subtask_id |
-- | ------- | ---------- |
-- | 1       | 1          |
-- | 1       | 2          |
-- | 1       | 3          |
-- | 2       | 1          |
-- | 2       | 2          |
-- | 3       | 1          |
-- | 3       | 2          |
-- | 3       | 3          |
-- | 3       | 4          |


-- | task_id | subtask_id | task_id | subtask_id |
-- | ------- | ---------- | ------- | ---------- |
-- | 1       | 1          | null    | null       |
-- | 1       | 2          | 1       | 2          |
-- | 1       | 3          | null    | null       |
-- | 2       | 1          | null    | null       |
-- | 2       | 2          | null    | null       |
-- | 3       | 1          | 3       | 1          |
-- | 3       | 2          | 3       | 2          |
-- | 3       | 3          | 3       | 3          |
-- | 3       | 4          | 3       | 4          |