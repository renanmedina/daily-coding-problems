```javascript
function constructTree(preOrder, inOrder) {
    if (preOrder.length === 0 || inOrder.length === 0) {
        return null;
    }

    const root = preOrder[0];
    let i = 1;

    while (inOrder[0] !== root && inOrder[i - 1] !== root) {
        i++;
    }

    if (i === inOrder.length) {
        return null;
    }

    const leftChildren = [];
    let j = 1;

    // Find indices of elements less than the current node
    while (j < inOrder.length && inOrder[j] < root) {
        leftChildren.push(inOrder[j]);
        j++;
    }

    const rightChildren = [];
    let k = i + 1;

    // Find indices of elements greater than the current node
    while (k < inOrder.length && inOrder[k] > root) {
        rightChildren.push(inOrder[k]);
        k++;
    }

    return new TreeNode(root, constructTree(preOrder.slice(1), leftChildren), constructTree(preOrder.slice(1 + i), rightChildren));
}

class TreeNode {
    constructor(value, left = null, right = null) {
        this.value = value;
        this.left = left;
        this.right = right;
    }
}
```