```python
def fullJustify(words, k):
    result = []
    current_line = []
    current_length = 0
    
    for word in words:
        if current_length + len(word) <= k:
            current_line.append(word)
            current_length += len(word)
        else:
            # Calculate the number of spaces needed
            num_spaces = k - current_length
            
            # Distribute the spaces evenly among the words except the last one
            for i in range(len(current_line) - 1):
                num_spaces_per_word = num_spaces // (len(current_line) - i)
                extra_spaces = num_spaces % (len(current_line) - i)
                
                current_line[i] += ' ' * (num_spaces_per_word + (1 if i < extra_spaces else 0))
            
            # Add the last word
            current_line.append(' ' * num_spaces)
            
            result.append(''.join(current_line))
            
            current_line = []
            current_length = 0
    
    # Handle the last line
    if current_line:
        last_word = ''
        for word in current_line:
            last_word += word + ' '
        
        last_word = last_word.strip()
        
        num_spaces = k - len(last_word)
        
        for _ in range(num_spaces):
            last_word += ' '
        
        result.append(last_word)
    
    return result
```