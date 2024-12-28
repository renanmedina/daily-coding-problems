```python
import collections

class LogRecord:
    def __init__(self):
        self.log = collections.deque()

    def record(self, order_id):
        self.log.append(order_id)

    def get_last(self, i):
        return self.log[-i - 1]
```

This solution uses a deque to store the last N order IDs. The `record` method adds an order ID to the right end of the deque, and the `get_last` method returns the element at the leftmost end (i.e., the i-th from the right end) of the deque.