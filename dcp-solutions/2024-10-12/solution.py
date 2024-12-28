```python
import heapq

class MedianFinder:
    def __init__(self):
        self.hi = [] # max heap 
        self.lo = [] # min heap 

    def addNum(self, num: int) -> None:
        if not self.lo or num <= -self.lo[0]:
            heapq.heappush(self.hi, -num)
        else:
            heapq.heappush(self.lo, num)

        self.balance()

    def balance(self):
        if len(self.hi) > len(self.lo) + 1:
            heapq.heappush(self.lo, -heapq.heappop(self.hi))
        elif len(self.lo) > len(self.hi):
            heapq.heappush(self.hi, -heapq.heappop(self.lo))

    def findMedian(self) -> float:
        if len(self.lo) == len(self.hi):
            return (-self.hi[0] + self.lo[0])/2
        else:
            return -self.hi[0]
```