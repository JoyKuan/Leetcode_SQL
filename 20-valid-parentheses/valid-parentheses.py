class Solution:
    def isValid(self, s: str) -> bool:
        # create a dictionary to store all pairs
        mapping = {
            ')':'(', 
            '}':'{', 
            ']':'['
        }
        stack = []

        for char in s:
            if char in mapping:
                if stack and stack[-1] == mapping[char]:
                    stack.pop()
                else:
                    return False
            else:
                stack.append(char)
        return not stack