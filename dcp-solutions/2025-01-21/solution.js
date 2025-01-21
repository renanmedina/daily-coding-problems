```javascript
class TreeNode {
    constructor(val, left = null, right = null) {
        this.val = val;
        this.left = left;
        this.right = right;
        this.parent = null;
    }
}

function inorderSuccessor(root, node) {
    // If the node is a leaf or its right child
    if (!node || !node.right) return null;

    // Find the rightmost node in the left subtree
    let current = node;
    while (current.right && current.right !== node) {
        current = current.right;
    }

    // Return the value of the rightmost node
    return current ? current.val : null;
}
```