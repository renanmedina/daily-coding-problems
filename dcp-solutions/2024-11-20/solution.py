```python
def rand5():
    """Returns a random integer between 1 and 5"""
    # We have two possible scenarios: either we get a number less than 7 from `rand7()` or 
    # we need to take the result of another call to `rand5()`
    
    # If we get something < 7, it's in range
    if (a := rand7()) <= 3:
        return a
    
    # Otherwise, we have to do it again!
    else:
        # However, the problem here is that we're called twice when we are called only once.
        # We can get around this by counting how many times `rand5()` is being called at any time. 
        # When the count is even, we return 0, and when it's odd, we return 1
        count = 0
        while True:
            b = rand7()
            c = rand7()
            if (a := c) <= 3:
                count += 1
                return a % 5 or 5
```