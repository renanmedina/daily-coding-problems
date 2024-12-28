```python
def divide(dividend: int, divisor: int) -> int:
    # Define signs of result
    sign = -1 if ((dividend < 0) ^ (divisor < 0)) else 1
    
    # Convert to positive
    dividend, divisor = abs(dividend), abs(divisor)
    
    quotient = 0
    while dividend >= divisor:
        temp, i = divisor, 1
        while dividend >= (temp << 1):
            temp <<= 1
            i <<= 1
        dividend -= temp
        quotient += i
    
    return sign * quotient
```