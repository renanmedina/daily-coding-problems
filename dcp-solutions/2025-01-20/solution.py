```python
import bisect

class HitCounter:

    def __init__(self):
        self.times = []
        self.hits = {}

    def record(self, timestamp: int) -> None:
        idx = bisect.bisect_left(self.times, timestamp)
        if idx == len(self.times):
            self.times.append(timestamp)
        else:
            self.times[idx] = timestamp
        if timestamp not in self.hits:
            self.hits[timestamp] = 1
        else:
            self.hits[timestamp] += 1

    def total(self) -> int:
        return sum(self.hits.values())

    def range(self, lower: int, upper: int) -> int:
        idx1 = bisect.bisect_left(self.times, lower)
        idx2 = bisect.bisect_right(self.times, upper)

        cnt = 0
        for i in range(idx1, idx2):
            if self.times[i] > lower and self.times[i] <= upper: 
                cnt += self.hits[self.times[i]]
            elif self.times[i] < lower:
                break

        return cnt
```

If our system has limited memory, we could use a data structure like a heap or a balanced binary search tree to keep track of the timestamps.