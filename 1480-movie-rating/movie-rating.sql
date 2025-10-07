-- Write your PostgreSQL query statement below
(select name AS results
from MovieRating mr
left join Users u on mr.user_id = u.user_id
group by name
order by count(*) desc, name
limit 1)
UNION ALL
(select title AS results
from MovieRating mr
left join Movies v on mr.movie_id = v.movie_id
where TO_CHAR(created_at, 'YYYY-MM') = '2020-02'
group by title
order by AVG(rating) desc, title
limit 1)

