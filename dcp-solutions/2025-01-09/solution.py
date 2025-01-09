```python
def canMakePali(string, k):
    left = 0
    right = len(string) - 1
    
    # counts of each character 
    char_count = {}
    
    while left < right:
        if string[left] == string[right]:
            # increment count for the repeating character
            char_count[string[left]] = char_count.get(string[left], 0) + 1
            left += 1
            right -= 1
            
        else:
            # decrement k by 1, since we can delete a character
            k -= 1
            
            if left < right and string[left] == string[right-1]:
                char_count[string[left]] = char_count.get(string[left], 0) + 1
                left += 1
            elif right > left and string[left+1] == string[right]:
                char_count[string[right]] = char_count.get(string[right], 0) + 1
                right -= 1
                
    # Check if we have an odd count of a character
    odd_count = False
    for count in char_count.values():
        if count % 2 != 0:
            odd_count = True
            
    return k >= len(string) - len(char_count) + (odd_count and 1 or 0)
```