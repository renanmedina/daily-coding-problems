```javascript
class TreeNode {
  constructor(val = 0, left = null, right = null) {
    this.val = val;
    this.left = left;
    this.right = right;
  }
}

function isSubtree(s, t) {
  const sStr = getTreeToArray(s);
  const tStr = getTreeToArray(t);

  return sStr.includes(tStr);
}

function getTreeToArray(root) {
  if (!root) return '';

  const left = getTreeToArray(root.left);
  const right = getTreeToArray(root.right);

  return (left + '' + root.val + '' + right).split('').sort().join('');
}
```