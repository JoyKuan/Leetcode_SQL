-- Write your PostgreSQL query statement below
WITH even_id AS(
    SELECT id, LAG(student) OVER(ORDER BY id) AS student FROM Seat
),
odd_id AS(
    SELECT id, LEAD(student) OVER(ORDER BY id) AS student FROM Seat
),
swap_combine AS(
    SELECT * FROM even_id WHERE id%2=0
    UNION
    SELECT * FROM odd_id WHERE id%2!=0
)



SELECT Seat.id,
    CASE 
        WHEN sc.student IS NULL THEN Seat.student ELSE sc.student
    END
FROM Seat
LEFT JOIN swap_combine sc ON Seat.id = sc.id








-- | id | student | 
-- | -- | ------- |
-- | 1  | Abbot   | 
-- | 2  | Doris   | Abbot
-- | 3  | Emerson | 
-- | 4  | Green   | Emerson
-- | 5  | Jeames  | NULL 