```python
def break_string(s, k):
    words = s.split()
    result = []
    current_line = ""
    
    for word in words:
        if len(current_line) + len(word) + 1 > k:
            # not enough space to put this word on the current line,
            # so start a new line
            if not current_line:
                return None
            result.append(current_line)
            current_line = word
        else:
            # can fit the word on the current line
            if current_line:
                current_line += " "
            current_line += word
    
    # add the last line to the result
    if current_line:
        result.append(current_line)
    
    return result
```