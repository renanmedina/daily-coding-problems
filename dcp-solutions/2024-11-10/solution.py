```python
def myPow(x: int, y: int) -> int:
    if x == 0 or y < 0:
        return 0
    
    if y == 1:
        return x
    
    half_pow = myPow(x, y // 2)
    
    result = 1
    
    if y % 2 == 1:
        result *= half_pow * half_pow
    else:
        result *= half_pow
    
    return result
```