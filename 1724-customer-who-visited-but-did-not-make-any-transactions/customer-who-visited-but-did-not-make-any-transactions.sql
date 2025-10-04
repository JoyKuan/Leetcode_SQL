-- Write your PostgreSQL query statement below
select customer_id, COUNT(customer_id) AS count_no_trans
from Visits
where visit_id NOT IN (select distinct visit_id from Transactions)
GROUP BY customer_id