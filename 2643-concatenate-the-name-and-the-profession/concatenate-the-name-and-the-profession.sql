-- Write your PostgreSQL query statement below
-- SELECT
--     person_id,
--     CONCAT(name, '(', LEFT(profession, 1),')' ) AS name
-- FROM Person
-- ORDER BY person_id DESC


SELECT
    person_id,
    name || '(' || LEFT(profession, 1) || ')' AS name
FROM Person
ORDER BY person_id DESC
