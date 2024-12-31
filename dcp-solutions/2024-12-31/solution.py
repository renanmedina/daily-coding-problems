```python
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None
        self.parent = None

def lowestCommonAncestor(root, p, q):
    # If the tree is empty
    if not root:
        return None
    
    # If both nodes are in left subtree
    if p.val < root.val and q.val < root.val:
        return lowestCommonAncestor(root.left, p, q)
    
    # If both nodes are in right subtree
    if p.val > root.val and q.val > root.val:
        return lowestCommonAncestor(root.right, p, q)
    
    # One of the nodes must be in left subtree and other in right subtree
    return root

# Test the function
root = TreeNode(6)
root.left = TreeNode(2)
root.right = TreeNode(8)
root.left.left = TreeNode(0)
root.left.right = TreeNode(4)
root.right.left = TreeNode(7)
root.right.right = TreeNode(9)

print(lowestCommonAncestor(root, root.left.right, root.right.left).val)  # Output: 6
```