```python
# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

class Solution:
    def deepestNode(self, root: TreeNode) -> TreeNode:
        return self._deepestNode(root)

    def _deepestNode(self, node):
        if not node or (node.left is None and node.right is None):
            return node
        
        l_depth = 0
        r_depth = 0
        left = right = None

        queue = [(node, 1)]
        
        while queue:
            curr_node, depth = queue.pop(0)
            
            if depth > l_depth:
                l_depth = depth
                left = curr_node
                
            if depth > r_depth:
                r_depth = depth
                right = curr_node
                
            if curr_node.left:
                queue.append((curr_node.left, depth + 1))
                
            if curr_node.right:
                queue.append((curr_node.right, depth + 1))
        
        return left.val if left else None
```