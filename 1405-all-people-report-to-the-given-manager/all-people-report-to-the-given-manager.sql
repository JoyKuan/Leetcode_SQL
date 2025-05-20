-- Write your PostgreSQL query statement below
WITH RECURSIVE manager_cte AS(
    SELECT employee_id
    FROM Employees
    WHERE employee_id = 1

    UNION

    SELECT e.employee_id
    FROM Employees e
    JOIN manager_cte m ON e.manager_id = m.employee_id
)

select * from manager_cte
where employee_id!=1

-- e 是整張員工表（所有人）
-- c 是已經知道的「主管群」（從 CTE 累積而來）
-- 所以你是從「所有人（e）」中，找出那些 他的上司在已知主管清單（c）裡的人。

