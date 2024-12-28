```javascript
class TreeNode {
    constructor(val, left = null, right = null, op = '') {
        this.val = val;
        this.left = left;
        this.right = right;
        this.op = op;
    }
}

function evaluateTree(root) {
    if (!root || root.val === 0) {
        return 0;
    }

    const leftVal = evaluateTree(root.left);
    const rightVal = evaluateTree(root.right);

    switch (root.op) {
        case '+':
            return leftVal + rightVal;
        case '-':
            return leftVal - rightVal;
        case '*':
            return leftVal * rightVal;
        default: // '/'
            if ((leftVal === 0 || rightVal === 0) && root.val !== '1') { // division by zero
                throw new Error('Division by Zero');
            }
            return leftVal / rightVal;
    }
}
```