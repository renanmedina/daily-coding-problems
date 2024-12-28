```python
def shift_string(A, B):
    if len(A) != len(B):
        return False
    
    A_sorted = sorted(A)
    B_sorted = sorted(B)

    return A_sorted == B_sorted
```