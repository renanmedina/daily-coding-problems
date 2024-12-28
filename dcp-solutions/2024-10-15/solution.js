```javascript
class Node {
    constructor(val) {
        this.val = val;
        this.left = null;
        this.right = null;
    }
}

function secondLargest(root) {
    let maxVal = -Infinity;
    let secondMaxVal = -Infinity;

    function traverse(node) {
        if (!node) return;

        traverse(node.left);
        if (node.val > maxVal) [secondMaxVal, maxVal] = [maxVal, node.val];
        if (node.val < maxVal && node.val > secondMaxVal) secondMaxVal = node.val;
        traverse(node.right);
    }

    traverse(root);

    return secondMaxVal === -Infinity ? null : secondMaxVal;
}
```