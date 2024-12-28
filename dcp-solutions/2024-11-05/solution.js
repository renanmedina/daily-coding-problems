### Solution
```javascript
function possibleColors(graph, k) {
    const numVertices = graph.length;
    
    // Perform DFS from an arbitrary vertex (we start with the first one)
    function dfs(currentVertex, colorsUsed, parentColor) {
        let result = true;
        
        for (let i = 0; i < numVertices; i++) {
            if (graph[currentVertex][i] === 1 && colorsUsed.includes(i)) {
                result = false;
                break;
            }
        }
        
        // Try each color from 1 to k
        for (let j = 1; j <= k; j++) {
            colorsUsed.push(j);
            
            if (!result) continue;
            
            let valid = true;
            for (let i = 0; i < numVertices; i++) {
                if (graph[currentVertex][i] === 1 && (parentColor === undefined || parentColor !== j)) {
                    // Assume we can color it with this color
                    let tempResult = dfs(i, [...colorsUsed], j);
                    
                    if (!tempResult) valid = false;
                }
            }
            
            result = valid;
            colorsUsed.pop();
        }
        
        return result;
    }
    
    for (let i = 0; i < numVertices; i++) {
        if (!dfs(i, [], undefined)) return false;
    }
    
    return true;
}
```