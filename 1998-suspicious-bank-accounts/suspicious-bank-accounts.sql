-- Write your PostgreSQL query statement below
with total_income_permonth AS(
    select account_id, to_char(day, 'YYYY-MM') AS month, sum(amount) AS total_income
    from Transactions
    where type = 'Creditor'
    group by account_id, to_char(day, 'YYYY-MM')
)

select distinct account_id
from (
    select t.account_id, month, 
    LAG(month) over(partition by t.account_id order by month) AS prev_month
    from total_income_permonth t
    left join Accounts a on t.account_id = a.account_id
    where total_income > max_income
)
where (TO_DATE(prev_month || '-01', 'YYYY-MM-DD') + INTERVAL '1 month')::date
= TO_DATE(month || '-01', 'YYYY-MM-DD')








-- | account_id | month   | total_income |prev_month
-- | ---------- | ------- | ------------ |
-- | 3          | 2021-06 | 300100       |
-- | 3          | 2021-07 | 64900        |2021-06
-- | 4          | 2021-05 | 49300        |
-- | 4          | 2021-07 | 56300        |2021-05
