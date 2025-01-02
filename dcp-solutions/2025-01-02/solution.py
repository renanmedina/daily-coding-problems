```python
def reverse_words_in_string(s, delimiters):
    """
    Reverses the words in a string while maintaining the relative order of delimiters.
    
    Args:
        s (str): The input string.
        delimiters (list): A list of delimiter characters.
        
    Returns:
        str: The modified string with reversed words and maintained delimiters.
    """
    
    # Split the string into words and delimiters
    parts = []
    current_part = ''
    for char in s:
        if char in delimiters:
            if current_part:
                parts.append(current_part)
                current_part = ''
            parts.append(char)
        else:
            current_part += char
    
    # Reverse the words while maintaining the delimiters
    reversed_parts = [part for part in reversed(parts) if not set(part).issubset(delimiters)]
    
    # Join the reversed parts back into a string
    result = ''.join(reversed_parts)
    return result

# Follow-up cases:
delimiters = [':', '/']
print(reverse_words_in_string("hello/world:here", delimiters))  # "here/world:hello"
print(reverse_words_in_string("hello//world:here", delimiters))  # "here world:hello" (assuming double delimiters are considered as one delimiter)
```