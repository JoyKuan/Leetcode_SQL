-- Write your PostgreSQL query statement below
select stock_name,
    sum(case operation
        when 'Buy' then (-1)*price 
        when 'Sell' then price 
    end) AS capital_gain_loss
from Stocks
group by stock_name


