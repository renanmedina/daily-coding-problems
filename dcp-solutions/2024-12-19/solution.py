```python
from collections import deque

def min_steps(points):
    """
    Calculate the minimum number of steps to visit all points in an infinite grid.

    Args:
        points (list[tuple[int, int]]): A list of coordinates representing the points to visit.

    Returns:
        int: The minimum number of steps required.
    """

    # Define the 8 possible movements
    directions = [(1, 0), (-1, 0), (0, 1), (0, -1), (-1, -1), (1, 1), (-1, 1), (1, -1)]

    def is_valid(x, y):
        return 0 <= x < len(points) and 0 <= y < len(points[0])

    queue = deque([(points[0][0], points[0][1])])
    visited = set([points[0]])
    steps = 0

    while queue:
        for _ in range(len(queue)):
            x, y = queue.popleft()
            if is_valid(x - 1, y) and (x - 1, y) not in visited:
                queue.append((x - 1, y))
                visited.add((x - 1, y))
            elif is_valid(x + 1, y) and (x + 1, y) not in visited:
                queue.append((x + 1, y))
                visited.add((x + 1, y))
            elif is_valid(x, y - 1) and (x, y - 1) not in visited:
                queue.append((x, y - 1))
                visited.add((x, y - 1))
            elif is_valid(x, y + 1) and (x, y + 1) not in visited:
                queue.append((x, y + 1))
                visited.add((x, y + 1))
            for dx, dy in directions:
                nx, ny = x + dx, y + dy
                if is_valid(nx, ny) and (nx, ny) not in visited:
                    queue.append((nx, ny))
                    visited.add((nx, ny))

        steps += 1

    return steps
```