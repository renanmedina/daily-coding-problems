```python
def bitwise_and(x: int, y: int, val: int) -> int:
    if not x and not y:
        raise ValueError("Cannot perform operation on zero values")
    result = (x | (~val & y)) & (~val)
    return result if x != result else result ^ ~val
```