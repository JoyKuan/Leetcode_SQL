-- Write your PostgreSQL query statement below
with cte as(
    select question_id,
    sum(case when action = 'answer' then 1 else 0 end)*1.0/count(distinct (id, question_id, timestamp)) as ans_rate
    from surveylog
    group by 1)

select min(question_id) as survey_log from cte 
WHERE ans_rate = (SELECT MAX(ans_rate) FROM cte)
having count(*) > 0;

-- SELECT question_id AS survey_log
-- FROM SurveyLog
-- GROUP BY question_id
-- ORDER BY COUNT(answer_id)*1.00 / SUM(CASE WHEN action='show' THEN 1 ELSE 0 END) DESC, question_id
-- LIMIT 1



-- SELECT question_id AS survey_log
-- FROM SurveyLog
-- GROUP BY question_id
-- ORDER BY SUM(CASE WHEN action='answer' THEN 1 ELSE 0 END)*1.0 / SUM(CASE WHEN action='show' THEN 1 ELSE 0 END) DESC, question_id ASC
-- LIMIT 1
