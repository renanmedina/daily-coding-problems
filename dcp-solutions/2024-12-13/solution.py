### Maximum Path Sum in Binary Tree
```python
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Solution:
    def maxPathSum(self, root):
        self.max_sum = float('-inf')
        
        def dfs(node):
            if not node:
                return 0
            
            left_sum = max(0, dfs(node.left))
            right_sum = max(0, dfs(node.right))
            
            self.max_sum = max(self.max_sum, left_sum + right_sum + node.val)
            
            return max(left_sum, right_sum) + node.val
        
        dfs(root)
        return self.max_sum
```