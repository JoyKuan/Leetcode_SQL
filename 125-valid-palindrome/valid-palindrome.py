class Solution:
    def isPalindrome(self, s: str) -> bool:
        # "0P"
        char_list = []
        for c in s:
            if c.isalnum():
                char_list.append(c.lower())
        s = ''.join(char_list)
        
        if s[::-1] == s[::]:
            return True
        else:
            return False


        