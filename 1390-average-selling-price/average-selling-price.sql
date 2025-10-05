-- Write your PostgreSQL query statement below
select p.product_id, 
    COALESCE(ROUND(sum(price*units) / NULLIF(sum(units), 0)::DECIMAL, 2), 0) AS average_price
from Prices p
left join UnitsSold u ON p.product_id = u.product_id AND purchase_date BETWEEN start_date AND end_date
group by p.product_id
