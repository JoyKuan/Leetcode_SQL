-- Write your PostgreSQL query statement below
select query_name,
    ROUND(SUM(rating / position::decimal)/ count(*)::decimal, 2) AS quality,
    ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END)*100 / count(*)::decimal, 2) AS poor_query_percentage
from Queries
group by query_name