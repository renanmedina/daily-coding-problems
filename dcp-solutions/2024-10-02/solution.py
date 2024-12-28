```python
from collections import deque

def shortestPath(grid, start, end):
    rows, cols = len(grid), len(grid[0])
    directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
    queue = deque([(start, 0)])
    visited = set([start])

    while queue:
        (x, y), steps = queue.popleft()
        if (x, y) == end:
            return steps
        for dx, dy in directions:
            nx, ny = x + dx, y + dy
            if (0 <= nx < rows and 0 <= ny < cols 
                and grid[nx][ny] == False 
                and (nx, ny) not in visited):
                queue.append(((nx, ny), steps + 1))
                visited.add((nx, ny))

    return None
```