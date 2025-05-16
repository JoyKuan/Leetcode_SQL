-- Write your PostgreSQL query statement below
-- WITH question_stats AS(
--     SELECT question_id,
--         SUM(CASE WHEN action='show' THEN 1 ELSE 0 END) AS show_cnt,
--         SUM(CASE WHEN action='answer' THEN 1 ELSE 0 END) AS ans_cnt
--     FROM SurveyLog
--     GROUP BY question_id
-- ),
-- ranked_questions AS(
--     SELECT 
--         question_id, 
--         ans_cnt*1.00 / NULLIF(show_cnt, 0) AS ans_rate,
--         RANK() OVER(ORDER BY ans_cnt*1.00 / NULLIF(show_cnt, 0) DESC, question_id) AS rnk
--     FROM question_stats   
-- )

-- SELECT question_id AS survey_log
-- FROM ranked_questions
-- WHERE rnk=1






SELECT question_id AS survey_log
FROM SurveyLog
GROUP BY question_id
ORDER BY COUNT(answer_id)*1.00 / NULLIF(SUM(CASE WHEN action='show' THEN 1 ELSE 0 END),0) DESC, question_id
LIMIT 1


