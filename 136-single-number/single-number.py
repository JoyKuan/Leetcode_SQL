class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        stack = []
        for num in nums:
            if num not in stack:
                stack.append(num)
            else:
                stack.remove(num)
        return stack.pop()



        