```python
from collections import defaultdict, deque

def findOrder(courses):
    graph = defaultdict(list)
    indegree = {course: 0 for course in courses}
    
    for course, prereqs in courses.items():
        for prereq in prereqs:
            graph[prereq].append(course)
            indegree[course] += 1
    
    queue = deque([course for course in courses if indegree[course] == 0])
    
    ordering = []
    while queue:
        course = queue.popleft()
        ordering.append(course)
        
        for neighbor in graph[course]:
            indegree[neighbor] -= 1
            if indegree[neighbor] == 0:
                queue.append(neighbor)
                
    return ordering if len(ordering) == len(courses) else None
```