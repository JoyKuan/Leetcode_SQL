from collections import Counter
class Solution:
    def canConstruct(self, ransomNote: str, magazine: str) -> bool:
        note = Counter(ransomNote)
        mag = Counter(magazine)

        if note & mag == note:
            return True
        else:
            return False