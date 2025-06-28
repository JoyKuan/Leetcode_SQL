-- Write your PostgreSQL query statement below
WITH CTE AS (
    SELECT 
        user_id, 
        spend,
        transaction_date, 
        LEAD(transaction_date) OVER w AS third_transaction_date,
        ROW_NUMBER() over w AS rn,
        LAG(spend) over w AS first_spend,
        LEAD(spend) over w AS third_spend
    FROM transactions
WINDOW w AS (PARTITION BY user_id ORDER BY transaction_date)
)

SELECT 
    user_id,
    third_spend AS third_transaction_spend,
    third_transaction_date
FROM CTE
WHERE rn=2 AND third_spend > spend AND third_spend > first_spend
ORDER BY user_id







-- with t as(select 
--     user_id, 
--     spend,
--     transaction_date, 
--     lead(transaction_date) over w third_transaction_date,
--     row_number() over w rn,
--     lag(spend) over w  prev_spend,
--     lead(spend) over w next_spend
-- from transactions
-- window w as (partition by user_id order by transaction_date))



-- select user_id, next_spend third_transaction_spend, third_transaction_date 
-- from t
-- where rn = 2
-- and next_spend > spend
-- and next_spend > prev_spend
-- order by user_id asc






-- Not good
-- WITH rnk_cte AS(
--     SELECT *, RANK() OVER(PARTITION BY user_id ORDER BY transaction_date) AS rnk
--     FROM Transactions
--     ORDER BY user_id, transaction_date
-- )

-- SELECT user_id, spend AS third_transaction_spend, transaction_date AS third_transaction_date
-- FROM rnk_cte c
-- WHERE rnk = 3 AND 
-- spend > (SELECT spend FROM rnk_cte WHERE user_id = c.user_id and rnk = 2) AND 
-- spend > (SELECT spend FROM rnk_cte WHERE user_id = c.user_id and rnk = 1)
