```python
def sort_characters(arr):
    """
    Segregate the values of the array so that all the Rs come first, 
    the Gs come second, and the Bs come last.
    
    Args:
        arr (list): A list of strictly the characters R, G, and B
    
    Returns:
        None
    """
    
    # Count the occurrences of each character
    r_count = 0
    g_count = 0
    b_count = 0
    for char in arr:
        if char == 'R':
            r_count += 1
        elif char == 'G':
            g_count += 1
        elif char == 'B':
            b_count += 1
    
    # Initialize pointers to track the current positions of Rs, Gs and Bs
    i = j = k = 0
    
    while i < len(arr) or j < len(arr) or k < len(arr):
        if i < len(arr) and arr[i] == 'R':
            arr[j], arr[k] = arr[k], arr[j]
            r_count -= 1
            j += 1
            k += 1
        elif j < len(arr) and arr[j] == 'G':
            arr[i], arr[j] = arr[j], arr[i]
            g_count -= 1
            i += 1
            j += 1
        else:
            if r_count > 0 or g_count > 0:
                arr[k], arr[j] = arr[j], arr[k]
                b_count -= 1
                k += 1
            else:
                j += 1

# Test the function with [G, B, R, R, B, R, G]
arr = ['G', 'B', 'R', 'R', 'B', 'R', 'G']
sort_characters(arr)
print(arr)