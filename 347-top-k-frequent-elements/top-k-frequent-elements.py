class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        from collections import Counter

        count = Counter(nums)   
        return [k for k, v in count.most_common(k)]


        