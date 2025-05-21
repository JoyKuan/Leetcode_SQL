-- Write your PostgreSQL query statement below
WITH company_tax_rate AS(
    SELECT
        company_id, 
        CASE
            WHEN MAX(salary) < 1000 THEN 0.00
            WHEN MAX(salary) between 1000 and 10000 THEN 0.24
            ELSE 0.49
        END AS tax_rate
    FROM Salaries
    GROUP BY company_id
)

SELECT 
    s.company_id,
    employee_id,
    employee_name,
    ROUND(salary - tax_rate * salary) AS salary
FROM Salaries s
INNER JOIN company_tax_rate ctr ON s.company_id = ctr.company_id