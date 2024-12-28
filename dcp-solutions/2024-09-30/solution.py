```python
import heapq

def minMeetingRooms(intervals):
    if not intervals:
        return 0
    
    # Sort intervals by start time
    intervals.sort(key=lambda x: x[0])
    
    # Initialize priority queue with end times
    pq = [intervals[0][1]]
    for i in range(1, len(intervals)):
        # If current interval starts after earliest end, update earliest end
        if intervals[i][0] >= pq[0]:
            heapq.heappop(pq)
        # Add end time of current interval to queue
        heapq.heappush(pq, intervals[i][1])
    
    # Return size of priority queue (minimum rooms required)
    return len(pq)
```