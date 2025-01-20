-- Write your PostgreSQL query statement below
WITH approval AS(
    SELECT TO_CHAR(trans_date, 'YYYY-MM') AS month, country,
    COUNT(id) AS approved_count, 
    SUM(amount) AS approved_amount
FROM Transactions
WHERE state='approved'
GROUP BY TO_CHAR(trans_date, 'YYYY-MM'), country
),

chargeback AS(
    SELECT TO_CHAR(c.trans_date, 'YYYY-MM') AS month, country,
    COUNT(trans_id) AS chargeback_count, 
    SUM(amount) AS chargeback_amount
FROM Transactions t
JOIN Chargebacks c ON t.id = c.trans_id
GROUP BY TO_CHAR(c.trans_date, 'YYYY-MM'), country
)

SELECT 
    COALESCE(c.month, a.month) AS month, 
    COALESCE(c.country, a.country) AS country,
    COALESCE(approved_count, 0) AS approved_count, 
    COALESCE(approved_amount,0) AS approved_amount, 
    COALESCE(chargeback_count,0) AS chargeback_count,
    COALESCE(chargeback_amount,0) AS chargeback_amount
FROM approval a
FULL OUTER JOIN chargeback c ON a.month=c.month AND a.country=c.country


-- | month   | country | approved_count | approved_amount |
-- | ------- | ------- | -------------- | --------------- |
-- | 2019-05 | US      | 1              | 1000            |
-- | 2019-06 | US      | 2              | 8000            |


-- | month   | country | chargeback_count | chargeback_amount |
-- | ------- | ------- | ---------------- | ----------------- |
-- | 2019-06 | US      | 1                | 1000              |
-- | 2019-05 | US      | 1                | 2000              |
-- | 2019-09 | US      | 1                | 5000              |


-- | month   | country | approved_count | approved_amount | month   | country | chargeback_count | chargeback_amount |
-- | ------- | ------- | -------------- | --------------- | ------- | ------- | ---------------- | ----------------- |
-- | 2019-06 | US      | 2              | 8000            | 2019-06 | US      | 1                | 1000              |
-- | 2019-05 | US      | 1              | 1000            | 2019-05 | US      | 1                | 2000              |
-- | null    | null    | null           | null            | 2019-09 | US      | 1                | 5000              |


