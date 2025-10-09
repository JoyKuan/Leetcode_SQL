class Solution:
    def canAttendMeetings(self, intervals: List[List[int]]) -> bool:
        # edge case = []
        intervals.sort(key = lambda x: x[0])

        for i in range(1, len(intervals)):
            prev_meeting = intervals[i-1]
            curr_meeting = intervals[i]

            if prev_meeting[1] > curr_meeting[0]:
                return False
        return True
