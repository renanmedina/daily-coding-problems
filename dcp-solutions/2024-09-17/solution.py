```python
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

def countUnivalSubtrees(root):
    def check(node, val):
        if node is None:
            return True
        if node.val != val:
            return False
        return check(node.left, val) and check(node.right, val)

    def dfs(node):
        if node is None:
            return 1, 0
        same_left = int(check(node.left, node.val))
        same_right = int(check(node.right, node.val))
        return same_left + same_right + (1 if node.left is None or node.right is None else dfs(node.left)[0] + dfs(node.right)[0])

    return dfs(root)[1]
```