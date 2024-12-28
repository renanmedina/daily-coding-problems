```python
from collections import OrderedDict, defaultdict

class Node:
    def __init__(self, key, value):
        self.key = key
        self.value = value
        self.timestamp = 0

class LFUCache:
    def __init__(self, capacity: int):
        """
        Initialize the LFU cache with a given capacity.
        
        :param capacity: The maximum number of items in the cache.
        """
        self.capacity = capacity
        self.key2node = {}
        self.count = defaultdict(int)
        self.min_timestamp = 0

    def get(self, key: int) -> int:
        """
        Get the value at a given key from the cache. If no such key exists, return None.
        
        :param key: The key to retrieve the value for.
        :return: The value associated with the key if it exists, otherwise None.
        """
        if key not in self.key2node:
            return None
        node = self.key2node[key]
        del self.key2node[key]
        self.count[node.key] -= 1
        if not self.count[node.key]:
            del self.count[node.key]
        
        # Update min_timestamp if necessary
        if len(self.count) == 0:
            self.min_timestamp += 1
        
        # Mark node as recently used
        node.timestamp = self.min_timestamp

        # Add node to the front of the ordered dictionary
        self.key2node[key] = node
        self.count[node.key] += 1
        return node.value

    def put(self, key: int, value: int) -> None:
        """
        Set a given key to a value in the cache. If the cache is full, remove the least frequently used item.
        
        :param key: The key to set the value for.
        :param value: The value to associate with the key.
        """
        if not self.capacity or key in self.key2node:
            return
        new_node = Node(key, value)
        self.count[key] = 1
        self.min_timestamp += 1
        self.key2node[key] = new_node
        
        # If cache is full, remove the least frequently used item
        if len(self.key2node) > self.capacity:
            k = min(self.key2node.keys(), key=lambda x: (self.count[x], self.key2node[x].timestamp))
            del self.key2node[k]
            del self.count[k]
```