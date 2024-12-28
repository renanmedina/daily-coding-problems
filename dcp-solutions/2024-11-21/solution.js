```javascript
class DFSResult {
    constructor(val = -Infinity) {
        this.val = val;
        this.path = [];
    }
}

function largestPathValue(graph, edges) {
    const n = graph.length;

    let adj = Array(n).fill().map(() => []);
    for (const [u, v] of edges) {
        adj[u].push(v);
    }

    function dfs(node, curVal) {
        const res = new DFSResult(curVal);

        if (!res.val) return res;

        for (const neighbor of adj[node]) {
            const { val: nextCurVal, path: nextPath } = dfs(neighbor, curVal + 1);
            if (nextCurVal === -Infinity) continue;
            if (nextCurVal < res.val) {
                res.val = nextCurVal;
                res.path = [...nextPath, node];
            }
        }

        return res;
    }

    let res = new DFSResult(-Infinity);

    for (let i = 0; i < n; i++) {
        const { val: curVal, path } = dfs(i, 0);
        if (curVal > res.val) res = curVal;
    }

    return res ? res.path : null;
}
```