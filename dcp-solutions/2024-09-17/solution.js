```javascript
class TreeNode {
    constructor(val = 0, left = null, right = null) {
        this.val = val;
        this.left = left;
        this.right = right;
    }
}

function countUnivalSubtrees(root) {
    function dfs(node, parent_val) {
        if (!node) return 1;

        let left_count = dfs(node.left, node.val);
        let right_count = dfs(node.right, node.val);

        return (left_count == 0 && right_count == 0) || (node.val == parent_val) ? left_count + right_count + 1 : 0;
    }

    return dfs(root, null);
}
```