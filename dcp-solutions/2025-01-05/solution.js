```javascript
class TreeNode {
    constructor(val = 0, left = null, right = null) {
        this.val = val;
        this.left = left;
        this.right = right;
    }
}

function minSumLevel(root) {
    if (!root) return 0;

    let queue = [{val: 0, level: 0, sum: root.val}];
    let levelWithMinSum = Infinity;

    while (queue.length) {
        let {level, sum} = queue.shift();

        if (sum < levelWithMinSum && level > levelWithMinSum) break;
        if (level === levelWithMinSum) {
            levelWithMinSum++;
        }

        if (root.left) {
            queue.push({val: root.left.val, level: level + 1, sum: sum + root.left.val});
        }
        if (root.right) {
            queue.push({val: root.right.val, level: level + 1, sum: sum + root.right.val});
        }
    }

    return levelWithMinSum;
}
```