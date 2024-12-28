```python
def min_columns_to_remove(matrix):
    rows = len(matrix)
    cols = len(matrix[0])
    
    # Sort each row's columns lexicographically
    for row in matrix:
        row.sort()
        
    max_count = 0
    prev_char = None
    
    for col in range(cols - 1, -1, -1):
        if prev_char is not None and ord(prev_char) > ord(matrix[0][col]):
            break
        else:
            prev_char = matrix[0][col]
            max_count += 1
            
    return cols - max_count
```