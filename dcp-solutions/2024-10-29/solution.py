```python
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

def evalTree(root):
    if root is None:
        return 0
    
    # Evaluate the left and right subtrees recursively
    left_val = evalTree(root.left)
    right_val = evalTree(root.right)

    # Calculate the value based on the operator at the current node
    if root.val == '+':
        return left_val + right_val
    elif root.val == '-':
        return left_val - right_val
    elif root.val == '*':
        return left_val * right_val
    else:  # root.val == '/'
        return int(left_val / right_val)
```