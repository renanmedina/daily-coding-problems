```python
import time
from functools import wraps

def debounce(f, n):
    """
    Debounces a function by a specified number of milliseconds.
    
    Args:
        f (function): The function to debounce.
        n (int): The delay in milliseconds.
        
    Returns:
        function: A new version of the input function with debouncing applied.
    """
    
    # Create a variable to hold the last time we called our function
    last_call_time = 0
    
    def wrapper(*args, **kwargs):
        nonlocal last_call_time
        
        # Get the current time
        now = time.time()
        
        # If it's been too long since the last call, update the last call time and return the result of calling our function
        if now - last_call_time >= n / 1000:
            last_call_time = now
            return f(*args, **kwargs)
        
        # Otherwise, wait until we've passed the delay and then return the result of calling our function
        else:
            time.sleep(n / 1000 - (now - last_call_time))
            last_call_time = now
            return f(*args, **kwargs)
    
    return wrapper
```