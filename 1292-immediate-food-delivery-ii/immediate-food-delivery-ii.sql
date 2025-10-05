-- Write your PostgreSQL query statement below
with first_order_cte as(
    select customer_id, MIN(order_date) AS first_date
    from Delivery
    group by customer_id
)

select
    ROUND(SUM(CASE WHEN (order_date = first_date) AND (order_date = customer_pref_delivery_date) THEN 1 ELSE 0 END)*100 / COUNT(distinct d.customer_id)::decimal, 2) AS immediate_percentage
from Delivery d
left join first_order_cte f on d.customer_id = f.customer_id




-- +-------------+-------------+------------+-----------------------------+
-- | delivery_id | customer_id | order_date | customer_pref_delivery_date |
-- +-------------+-------------+------------+-----------------------------+
-- | 1           | 1           | 2019-08-01 | 2019-08-02                  |0
-- | 2           | 2           | 2019-08-02 | 2019-08-02                  | 1
-- | 3           | 1           | 2019-08-11 | 2019-08-12                  |0
-- | 4           | 3           | 2019-08-24 | 2019-08-24                  |0
-- | 5           | 3           | 2019-08-21 | 2019-08-22                  |0
-- | 6           | 2           | 2019-08-11 | 2019-08-13                  |0
-- | 7           | 4           | 2019-08-09 | 2019-08-09                  |1
-- +-------------+-------------+------------+-----------------------------+