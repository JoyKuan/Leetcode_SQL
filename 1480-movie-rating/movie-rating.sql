-- Write your PostgreSQL query statement below

(SELECT name AS results
FROM Users
RIGHT JOIN (
    SELECT user_id, COUNT(movie_id) AS greatest_num
    FROM MovieRating
    GROUP BY user_id
) u ON Users.user_id = u.user_id
ORDER BY greatest_num DESC, name 
LIMIT 1)

UNION ALL

(SELECT title AS results
FROM Movies
RIGHT JOIN (
    SELECT movie_id, AVG(rating) AS avg
    FROM MovieRating
    WHERE TO_CHAR(created_at, 'YYYY-MM')='2020-02'
    GROUP BY movie_id
    ) avg ON Movies.movie_id = avg.movie_id
ORDER BY avg DESC, title 
LIMIT 1)

