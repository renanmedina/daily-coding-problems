```python
from collections import deque

def largestPathValue(graph, edges):
    n = len(graph)
    neighbors = [[] for _ in range(n)]
    for u, v in edges:
        neighbors[u].append(v)

    max_path_value = 0
    has_infinite_loop = False

    def dfs(node, parent, value):
        nonlocal max_path_value
        nonlocal has_infinite_loop

        stack = deque([node])
        visited = set()
        path = []
        
        while stack:
            current_node = stack.pop()
            
            if current_node in visited:
                return float('inf')
                
            visited.add(current_node)
            path.append(current_node)

            for neighbor in neighbors[current_node]:
                if neighbor == parent:  # self-edge
                    continue
                if neighbor not in neighbors or len(neighbors[neighbor]) == 0:  # node is visited and has no more edge
                    return float('inf')
                
                stack.appendleft(neighbor)
                value = max(value, dfs(neighbor, current_node, value) + 1)

        path_value = ''.join([graph[i] for i in path])
        if path_value == graph[node]:
            nonlocal has_infinite_loop
            if value > max_path_value:
                max_path_value = value
            else:
                has_infinite_loop = True
        return value

    for node in range(n):
        dfs(node, -1, 0)

    if has_infinite_loop:
        return None
    return max_path_value
```