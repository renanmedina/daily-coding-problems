```python
def length_of_longest_substring_k_distinct(s: str, k: int) -> int:
    """
    This function returns the length of the longest substring with at most k distinct characters.

    Args:
        s (str): The input string.
        k (int): The maximum number of distinct characters allowed in the substring.

    Returns:
        int: The length of the longest substring with at most k distinct characters.
    """
    
    # Initialize a dictionary to store the frequency of each character
    char_freq = {}
    
    # Initialize two pointers for the sliding window
    left = 0
    
    # Initialize the maximum length of substring
    max_length = 0
    
    # Iterate over the string
    for right, char in enumerate(s):
        # Increment the frequency of the current character
        char_freq[char] = char_freq.get(char, 0) + 1
        
        # While there are more than k distinct characters in the window
        while len(char_freq) > k:
            # Decrement the frequency of the character at the left pointer
            char_freq[s[left]] -= 1
            
            # If the frequency becomes zero, remove the character from the dictionary
            if char_freq[s[left]] == 0:
                del char_freq[s[left]]
            
            # Move the left pointer to the right
            left += 1
        
        # Update the maximum length of substring
        max_length = max(max_length, right - left + 1)
    
    return max_length
```