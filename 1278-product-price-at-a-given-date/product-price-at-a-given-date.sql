-- Write your PostgreSQL query statement below
-- 2019-08-16 之前都沒有，assign 10
select product_id, 10 AS price
from Products
group by product_id
having min(change_date) > '2019-08-16'
union
-- 剛好那天有改變 or 介在兩個日期之間，選小於 2019-08-16
select product_id, new_price as price
from Products
where (product_id, change_date) in (
    select product_id, max(change_date) AS change_date
    from Products
    where change_date <= '2019-08-16'
    group by product_id
)







-- +------------+-----------+-------------+
-- | product_id | new_price | change_date |
-- +------------+-----------+-------------+
-- | 1          | 20        | 2019-08-14  |
-- | 1          | 30        | 2019-08-15  |
-- | 1          | 35        | 2019-08-16 
--   2          | 50        | 2019-08-14 |
-- | 2          | 65        | 2019-08-17  |
-- | 3          | 20        | 2019-08-18  |
-- +------------+-----------+-------------+