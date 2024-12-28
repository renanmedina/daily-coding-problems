```python
from collections import defaultdict

def shortest_substring(s, chars):
    if not s or not chars:
        return None
    
    char_count = defaultdict(int, {char: 0 for char in chars})
    required_chars = len(char_count)
    
    left = start = 0
    min_length = float('inf')
    min_window = ""
    
    for right in range(len(s)):
        char = s[right]
        
        if char not in char_count or char_count[char] == 0:
            continue
            
        char_count[char] += 1
        
        if char_count[char] == 1:
            required_chars -= 1
            
        if required_chars == 0:
            while left <= right:
                min_length = min(min_length, right - left + 1)
                
                if s[left] not in char_count or char_count[s[left]] == 0:
                    break
                
                char_count[s[left]] -= 1
                if char_count[s[left]] == 0:
                    required_chars += 1
                
                left += 1
            
            start = left
    
    return min_window if min_length != float('inf') else None
```