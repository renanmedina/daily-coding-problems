```python
import threading

def schedule_function(f, n):
    """
    Schedules a function to be called after n milliseconds.

    Args:
        f (function): The function to be scheduled.
        n (int): The number of milliseconds to delay the function call.

    Returns:
        A threading event that can be used to wait for the function to finish.
    """

    def wrapper():
        # Call the original function
        f()
    
    # Create a new thread that calls the wrapper function after n milliseconds
    threading.Timer(n / 1000, wrapper).start()

    # Return an event that will trigger when the function is finished
    return threading.Event()
```