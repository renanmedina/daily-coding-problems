```python
# Definition for a binary tree node.
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

def minPathSum(root):
    self.res = float('inf')
    
    def dfs(node, current_sum):
        if not node:
            return
        current_sum += node.val
        if not node.left and not node.right:
            self.res = min(self.res, current_sum)
            return
        dfs(node.left, current_sum)
        dfs(node.right, current_sum)

    dfs(root, 0)
    return self.res
```