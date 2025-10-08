class Solution:
    def checkSubarraySum(self, nums: List[int], k: int) -> bool:
        reminderHashMap = {0 : -1}
        cur_sum = 0

        for idx, num in enumerate(nums):
            cur_sum += num
            rem = cur_sum % k
            if rem not in reminderHashMap:
                reminderHashMap[rem] = idx
            elif (rem in reminderHashMap) and (idx - reminderHashMap[rem] > 1):
                return True
        return False
