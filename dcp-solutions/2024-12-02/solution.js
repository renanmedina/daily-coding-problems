```javascript
class TreeNode {
    constructor(val, left = null, right = null) {
        this.val = val;
        this.left = left;
        this.right = right;
    }
}

function invertTree(root) {
    if (!root) return null;

    [root.left, root.right] = [invertTree(root.right), invertTree(root.left)];
    return root;
}
```