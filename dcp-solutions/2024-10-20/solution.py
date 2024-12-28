```python
from collections import defaultdict, deque

def findItinerary(flights, start):
    # Build graph from flights
    graph = defaultdict(list)
    for origin, destination in sorted(flights):
        graph[origin].append(destination)

    # Perform DFS to find the lexicographically smallest itinerary
    def dfs(current_node, visited):
        if current_node == start:
            return visited[:]
        for neighbor in sorted(graph[current_node]):
            if neighbor not in visited:
                new_visited = visited + [neighbor]
                result = dfs(neighbor, new_visited)
                if result is not None:
                    return result
        return None

    # Start DFS from the starting airport
    return dfs(start, [])