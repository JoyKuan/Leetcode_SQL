CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY (
    -- Write your PostgreSQL query statement below.
    select a.salary
    from (select e.salary, dense_rank() over (order by e.salary desc) r from Employee e) a
    where a.r = n
    limit 1
      
  );
END;
$$ LANGUAGE plpgsql;