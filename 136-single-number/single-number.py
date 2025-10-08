class Solution:
    def singleNumber(self, nums: List[int]) -> int:

        if len(nums) == 1:
            return nums[0]
        
        stack = []
        for num in nums:
            if stack and num in stack:
                stack.remove(num)
            else:
                stack.append(num)
        return stack[0]



        