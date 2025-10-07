-- Write your PostgreSQL query statement below
select id,
    case
        when id%2=0 then LAG(student) OVER(ORDER BY id) 
        when id%2!=0 and LEAD(student) OVER(ORDER BY id) IS NOT NULL then LEAD(student) OVER(ORDER BY id) else student
    end AS student
from Seat
order by id
