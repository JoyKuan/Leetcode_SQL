class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        from collections import defaultdict
        dic = defaultdict(int)

        for n in nums:
            dic[n] += 1
        
        for n in dic:
            if dic[n] == 1:
                return n




        #  stack = []
        # for num in nums:
        #     if num not in stack:
        #         stack.append(num)
        #     else:
        #         stack.remove(num)
        # return stack.pop()       