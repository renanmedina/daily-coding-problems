```python
# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

def invertTree(root: TreeNode) -> TreeNode:
    if not root:
        return None
    
    # Swap the values of left and right nodes
    root.val, root.left.val, root.right.val = root.right.val, root.left.val, root.right.val
    
    # Recursively invert the left and right subtrees
    temp = root.left
    root.left = invertTree(root.right)
    root.right = temp
    
    return root
```