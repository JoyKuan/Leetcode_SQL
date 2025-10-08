class Solution:
    def merge(self, intervals: List[List[int]]) -> List[List[int]]:
        # step 1: sort by start 
        intervals.sort(key = lambda x: x[0])
        output = [intervals[0]]
    
        # check overlap and if yes, merge them, if not, add to the output 
        for start, end in intervals[1:]:
            lastend = output[-1][1]
            if start <= lastend:
                # overlap, then merge
                output[-1][1] = max(lastend, end)
            else:
                # not overlap, add to the output
                output.append([start, end])
        return output