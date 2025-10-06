-- Write your PostgreSQL query statement below
select distinct num AS ConsecutiveNums
from (
    select 
        num,
        LAG(num) over() AS prev,
        LAG(num, 2) over() AS former
    from Logs
)
where num = prev AND num=former AND prev=former


-- +----+-----+
-- | id | num | LAG(1) LAG(2)
-- +----+-----+
-- | 1  | 1   | null  null
-- | 2  | 1   | 1     null 
-- | 3  | 1   | 1      1
-- | 4  | 2   | 1      1
-- | 5  | 1   | 2      1
-- | 6  | 2   | 1      2
-- | 7  | 2   | 2      1
--        2     2     2


-- +----+-----+