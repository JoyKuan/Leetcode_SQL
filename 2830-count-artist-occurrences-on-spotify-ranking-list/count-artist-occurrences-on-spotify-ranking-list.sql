-- Write your PostgreSQL query statement below
SELECT artist, COUNT(*) AS occurrences
FROM Spotify
GROUP BY 1
ORDER BY COUNT(*) DESC, artist ASC