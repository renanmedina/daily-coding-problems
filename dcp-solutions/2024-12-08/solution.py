```python
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

def isValidBST(root: TreeNode) -> bool:
    return helper(root, float('-inf'), float('inf'))

def helper(node: TreeNode, lower_bound: float, upper_bound: float) -> bool:
    if node is None:
        return True
    
    if not (lower_bound <= node.val <= upper_bound):
        return False
    
    return (helper(node.left, lower_bound, node.val) and 
            helper(node.right, node.val, upper_bound))
```