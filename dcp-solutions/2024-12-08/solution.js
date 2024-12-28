```javascript
class TreeNode {
    constructor(val, left = null, right = null) {
        this.val = val;
        this.left = left;
        this.right = right;
    }
}

function isValidBST(root) {
    return helper(null, root, Infinity, -Infinity);
}

function helper(low, root, high, val) {
    if (!root) {
        return true;
    }

    if ((low !== null && root.val <= low) || (high !== null && root.val >= high)) {
        return false;
    }

    return helper(val < root.val ? low : root.val, root.left, high, root.val)
           && helper(val > root.val ? root.val : high, root.right, val, root.val);
}
```