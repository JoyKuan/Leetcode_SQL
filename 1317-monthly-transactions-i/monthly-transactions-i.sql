-- Write your PostgreSQL query statement below
 select 
    TO_CHAR(trans_date, 'YYYY-MM') AS month,
    country,
    count(*) AS trans_count,
    SUM(CASE WHEN state='approved' THEN 1 ELSE 0 END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state='approved' THEN amount ELSE 0 END) AS approved_total_amount
 from Transactions
 group by country, TO_CHAR(trans_date, 'YYYY-MM')