-- Write your PostgreSQL query statement below
select round(sum(tiv_2016)::decimal, 2) AS tiv_2016
from Insurance
where tiv_2015 IN(
    select tiv_2015
    from Insurance
    group by tiv_2015
    having count(*) > 1
) AND (lat, lon) IN (
    select lat, lon
    from Insurance
    group by lat, lon
    having count(*) = 1
)





