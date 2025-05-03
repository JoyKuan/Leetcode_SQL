-- Write your PostgreSQL query statement below
select to_char(day, 'FMDay, FMMonth FMDD, YYYY') as day
from Days