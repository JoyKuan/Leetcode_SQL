-- Write your PostgreSQL query statement below
with cte as(
    select
        t.account_id, date_trunc('month', day) AS trans_month,
        LAG(date_trunc('month', day)) over(partition by t.account_id order by date_trunc('month', day)) AS prev_trans_month
    from Transactions t
    join Accounts a on t.account_id = a.account_id
    where type = 'Creditor'
    group by t.account_id, max_income, date_trunc('month', day)
    having sum(amount) > max_income
    order by t.account_id, trans_month
)
select distinct account_id
from cte
where prev_trans_month + interval '1 month' = trans_month










-- | account_id | month   | total_income |prev_month
-- | ---------- | ------- | ------------ |
-- | 3          | 2021-06 | 300100       |
-- | 3          | 2021-07 | 64900        |2021-06
-- | 4          | 2021-05 | 49300        |
-- | 4          | 2021-07 | 56300        |2021-05
