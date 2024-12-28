```python
from collections import deque

def min_steps(points):
    """
    This function calculates the minimum number of steps required to visit all points in a grid.
    
    Parameters:
    points (list): A list of tuples representing the coordinates of points to be visited.
    
    Returns:
    int: The minimum number of steps required to visit all points.
    """
    
    # Create a set for faster lookup
    point_set = set(points)
    
    # Initialize the queue with starting point and distance 0, along with its parent (None) and direction (-1,-1)
    queue = deque([(points[0], 0, None, -1)])
    
    # Possible directions in the grid
    dx = [0, 0, -1, 0, -1, -1, -1, 1]
    dy = [-1, 1, 0, 0, -1, -1, 1, 1]
    
    while queue:
        # Dequeue the next point
        (x, y), dist, p, d = queue.popleft()
        
        # If we have visited all points, return the distance
        if len(point_set) == dist + 1:
            return dist
        
        # Explore neighbors in all directions
        for i in range(8):
            nx, ny = x + dx[i], y + dy[i]
            
            # If neighbor is a valid point and not visited yet
            if (nx, ny) in point_set and p != (nx, ny):
                queue.append(((nx, ny), dist+1, (x,y), i))
                
    # Return -1 if there's no solution
    return -1
```