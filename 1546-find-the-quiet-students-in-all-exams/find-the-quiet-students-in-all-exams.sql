-- Write your PostgreSQL query statement below
with cte AS(
    select distinct student_id
    from (
        select exam_id, student_id, score,
            first_value(score) over(partition by exam_id order by score desc) AS max_score,
            first_value(score) over(partition by exam_id order by score) AS min_score
        from Exam
    )
    where score IN (min_score, max_score)
)
select student_id, student_name
from Student
where student_id not in (select student_id from cte) AND student_id in (select distinct student_id from Exam)
