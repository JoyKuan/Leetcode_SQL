-- Write your PostgreSQL query statement below
WITH call_duration_rank AS(
    SELECT
        contact_id, 
        type,
        TO_CHAR((duration || ' second')::interval, 'HH24:MI:SS') AS duration_formatted,
        RANK() OVER(PARTITION BY type ORDER BY TO_CHAR((duration || ' second')::interval, 'HH24:MI:SS') DESC) AS rnk
    FROM Calls
),
three_longest_calls AS(
    SELECT *
    FROM call_duration_rank
    WHERE rnk IN (1, 2, 3)
)

SELECT first_name, type, duration_formatted
FROM three_longest_calls tlc
JOIN Contacts c ON tlc.contact_id = c.id
ORDER BY type DESC, duration_formatted DESC, first_name DESC










-- +------------+----------+----------+
-- | contact_id | type     | duration |
-- +------------+----------+----------+
-- | 1          | outgoing | 180      | 3
-- | 2          | outgoing | 240      | 4  --> Jane
-- | 3          | outgoing | 360      | 6  --> Alice
-- | 4          | outgoing | 200      | 3.
-- | 5          | outgoing | 280      | 4. --> Emily
-- +------------+----------+----------+
-- | 1          | incoming | 120      | 2
-- | 2          | incoming | 300      | 5  --> Jane
-- | 3          | incoming | 150      | 2.
-- | 4          | incoming | 420      | 7  --> Michael
-- | 5          | incoming | 180      | 3  --> Emily
        
