```python
import random

def uniform_random_number(n, lst):
    """
    Returns a uniformly random integer between 0 and n-1 
    that is not in the given list.

    Args:
        n (int): The upper bound of the range.
        lst (list): A list of integers to exclude from the selection.

    Returns:
        int: A uniform random integer between 0 and n-1 
             that is not in the given list.
    """
    while True:
        num = random.randint(0, n - 1)
        if num not in lst:
            return num
```