```python
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None
        self.parent = None

def inorder_successor(root, node):
    """
    Returns the next bigger element in a binary search tree.
    
    Parameters:
    root (TreeNode): The root of the binary search tree.
    node (TreeNode): The current node.
    
    Returns:
    int: The value of the next bigger element.
    """
    # If the node is None, there is no successor
    if not node:
        return None

    # Find the rightmost node in the left subtree
    rightmost = None
    while node.right:
        rightmost = node.right
        node = node.right

    # If the node is a leaf node or its parent's value is greater than or equal to its value, there is no successor
    if not rightmost or rightmost.val <= node.val:
        return None

    # Return the value of the next bigger element
    return rightmost.val
```