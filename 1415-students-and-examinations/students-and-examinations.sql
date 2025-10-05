-- Write your PostgreSQL query statement below
select st.student_id, student_name, sb.subject_name, count(e.subject_name) AS attended_exams
from Students st
cross join Subjects sb
left join Examinations e ON st.student_id = e.student_id AND sb.subject_name = e.subject_name
group by st.student_id, student_name, sb.subject_name
order by st.student_id, sb.subject_name


