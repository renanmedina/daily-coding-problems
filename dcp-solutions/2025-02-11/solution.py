```python
import heapq

class Stack:
    def __init__(self):
        self.heap = []

    def push(self, item):
        """Adds an element to the stack"""
        # Use the - operator to ensure heap is sorted in descending order
        heapq.heappush(self.heap, -item)

    def pop(self):
        """Removes and returns the most recently added element from the stack"""
        if not self.is_empty():
            return -heapq.heappop(self.heap)
        else:
            raise IndexError("Cannot pop from an empty stack")
    
    def is_empty(self):
        """Checks if the stack is empty"""
        return len(self.heap) == 0
```