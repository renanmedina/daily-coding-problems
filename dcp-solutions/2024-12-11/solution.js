```javascript
function findOrder(courses) {
    let graph = {};
    let inDegree = {};

    // Populate graph and in-degree dictionary
    for (let course in courses) {
        graph[course] = courses[course];
        inDegree[course] = 0;
    }

    // Build the graph and calculate in-degrees
    for (let preRequisite of Object.values(graph)) {
        for (let nextCourse of preRequisite) {
            if (!inDegree[nextCourse]) {
                inDegree[nextCourse] = 1;
            } else {
                inDegree[nextCourse]++;
            }
        }
    }

    // Initialize queue with courses having an in-degree of 0
    let queue = Object.keys(inDegree).filter(course => inDegree[course] === 0);

    // Sort the courses and build the result array
    let result = [];
    while (queue.length > 0) {
        let course = queue.shift();
        result.push(course);
        for (let nextCourse of graph[course]) {
            inDegree[nextCourse]--;
            if (inDegree[nextCourse] === 0) {
                queue.push(nextCourse);
            }
        }
    }

    // If there are remaining courses with non-zero in-degree, return null
    for (let course in inDegree) {
        if (inDegree[course] !== 0) {
            return null;
        }
    }

    return result;
}
```