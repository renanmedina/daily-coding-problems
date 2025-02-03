```python
# Definition for a binary tree node.
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

def pruneTree(root):
    return prunetree_recursive(root)

def prunetree_recursive(node):
    if not node:
        return False
    
    is_zero = node.val == 0 and (not node.left or not prunetree_recursive(node.left)) and not node.right or not prunetree_recursive(node.right)
    
    if is_zero:
        return None
    else:
        node.left = prunetree_recursive(node.left)
        node.right = prunetree_recursive(node.right)
        
        return node
```