CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY (

    WITH emp_rank AS (
        SELECT 
            DISTINCT e.Salary,
            DENSE_RANK() OVER(ORDER BY e.Salary DESC) rnk
        FROM Employee e
    )

    SELECT e.Salary 
    FROM emp_rank e
    WHERE e.rnk = N
    LIMIT 1
    
  );
END;
$$ LANGUAGE plpgsql;