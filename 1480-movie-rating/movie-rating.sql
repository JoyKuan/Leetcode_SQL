-- Write your PostgreSQL query statement below

(SELECT name AS results
FROM Users
RIGHT JOIN (
    SELECT user_id,
    DENSE_RANK() OVER(ORDER BY COUNT(DISTINCT movie_id) DESC) AS rnk
    FROM MovieRating
    GROUP BY user_id
) u ON Users.user_id = u.user_id
WHERE rnk=1
ORDER BY name 
LIMIT 1)

UNION ALL

(SELECT title AS results
FROM Movies
RIGHT JOIN (
    SELECT movie_id,
        DENSE_RANK() OVER(ORDER by AVG(rating) DESC) AS rnk
    FROM MovieRating
    WHERE TO_CHAR(created_at, 'YYYY-MM')='2020-02'
    GROUP BY movie_id
    ) avg ON Movies.movie_id = avg.movie_id
WHERE rnk=1
ORDER BY title
LIMIT 1)

