```python
import bisect

class Map:
    def __init__(self):
        self.keys = []
        self.values = []

    def set(self, key, value, time):
        idx = bisect.bisect_left(self.keys, time)
        if idx == 0 or self.keys[idx-1] < time:
            self.keys.insert(0, time)
            self.values.insert(0, value)
        elif self.keys[idx] > time:
            self.keys.insert(idx, time)
            self.values.insert(idx, value)

    def get(self, key, time):
        idx = bisect.bisect_left(self.keys, time)
        if idx < len(self.keys) and self.keys[idx] >= time:
            return self.values[idx]
        return None
```