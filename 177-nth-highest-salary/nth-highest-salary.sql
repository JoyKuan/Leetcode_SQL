CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY (

    SELECT a.Salary 
    FROM (SELECT e.Salary,DENSE_RANK() OVER(ORDER BY e.Salary DESC) rnk FROM Employee e) a
    WHERE a.rnk = N
    LIMIT 1
    
  );
END;
$$ LANGUAGE plpgsql;