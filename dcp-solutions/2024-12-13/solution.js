```javascript
class TreeNode {
    constructor(val) {
        this.val = val;
        this.left = null;
        this.right = null;
    }
}

function maxPathSum(root) {
    let res = -Infinity;

    function dfs(node, current_sum) {
        if (!node) return 0;
        current_sum += node.val;
        let left = Math.max(dfs(node.left, current_sum), 0);
        let right = Math.max(dfs(node.right, current_sum), 0);
        res = Math.max(res, current_sum + left + right);
        return Math.max(left, right);
    }

    dfs(root, 0);
    return res;
}
```