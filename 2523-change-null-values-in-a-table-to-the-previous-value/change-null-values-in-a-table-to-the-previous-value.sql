-- Write your PostgreSQL query statement below
with cte as(
    select id, drink,
    count(*) filter(where drink is not null) over(rows between unbounded preceding and current row)
    from CoffeeShop

)
select
    id, 
    coalesce(drink, first_value(drink) over(partition by count)) AS drink
from cte


-- | id | drink             | count |
-- | -- | ----------------- | ----- |
-- | 9  | Rum and Coke      | 1     |
-- | 6  | null              | 1     |
-- | 7  | null              | 1     |
-- | 3  | St Germain Spritz | 2     |
-- | 1  | Orange Margarita  | 3     |
-- | 2  | null              | 3     |