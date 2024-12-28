```javascript
class TreeNode {
    constructor(val) {
        this.val = val;
        this.left = null;
        this.right = null;
    }
}

function printTreeLevelWise(root) {
    if (!root) return;

    let queue = [root];

    while (queue.length > 0) {
        let levelSize = queue.length;
        for (let i = 0; i < levelSize; i++) {
            let node = queue.shift();
            process.stdout.write(node.val + " ");
            if (node.left) queue.push(node.left);
            if (node.right) queue.push(node.right);
        }
        console.log();
    }
}
```