```javascript
function findItinerary(flights) {
    flights.sort((a, b) => a[0].localeCompare(b[0]));
    const graph = {};
    for (const [from, to] of flights) {
        if (!graph[from]) graph[from] = [];
        graph[from].push(to);
    }
    
    function dfs(currentCity, path) {
        while (graph[currentCity] && graph[currentCity][0] < path[path.length - 1]) {
            dfs(graph[currentCity][0], [...path, graph[currentCity][0]]);
        }
        
        if (graph[currentCity] && graph[currentCity].length === 0) return [currentCity, ...path];
        if (!graph[currentCity]) return null;
        
        for (const nextCity of graph[currentCity]) {
            const result = dfs(nextCity, [...path, nextCity]);
            if (result !== null) return result;
        }
    }
    
    return dfs(flights[0][0], [flights[0][0]]) || null;
}
```