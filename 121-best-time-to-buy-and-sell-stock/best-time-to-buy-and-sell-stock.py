class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        max_profit = 0
        buy_p = prices[0]

        for cur_p in prices[1:]:
            if buy_p > cur_p:
                buy_p = cur_p
            else:
                max_profit = max(max_profit, cur_p-buy_p)
        return max_profit
