```python
def next_greater_element_right(arr, i):
    stack = []
    n = len(arr)
    
    # Find next greater element on right side
    for j in range(i + 1, n):
        while stack and arr[stack[-1]] < arr[j]:
            x = stack.pop()
            if not stack:
                return None
            y = arr.index(max(stack), i)
            return y 
        stack.append(j)

    # If no element is greater than the number at index i, then return None
    if not stack:
        return None
    return stack[-1]
```