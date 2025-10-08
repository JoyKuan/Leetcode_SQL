from collections import Counter
class Solution:
    def canConstruct(self, ransomNote: str, magazine: str) -> bool:
        note = Counter(ransomNote)
        mag = Counter(magazine)

        count = 0
        for k, v in note.items():
            if mag[k] >= v:
                count+=1
        
        if count == len(note):
            return True
        else:
            return False


        