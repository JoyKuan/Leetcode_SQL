-- Write your PostgreSQL query statement below


SELECT question_id AS survey_log
FROM SurveyLog
GROUP BY question_id
ORDER BY COUNT(answer_id)*1.00 / NULLIF(SUM(CASE WHEN action='show' THEN 1 ELSE 0 END),0) DESC, question_id
LIMIT 1



-- SELECT question_id AS survey_log
-- FROM SurveyLog
-- GROUP BY question_id
-- ORDER BY SUM(CASE WHEN action='answer' THEN 1 ELSE 0 END)*1.0 / SUM(CASE WHEN action='show' THEN 1 ELSE 0 END) DESC, question_id ASC
-- LIMIT 1
