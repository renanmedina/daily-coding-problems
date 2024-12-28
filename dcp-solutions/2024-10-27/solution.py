```python
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

def buildTree(preOrder, inOrder):
    if not preOrder or not inOrder:
        return None

    indexMap = {node: i for i, node in enumerate(inOrder)}

    def constructTree(start, end):
        if start > end:
            return None

        root_val = preOrder[start]
        root = TreeNode(root_val)

        mid = (start + end) // 2
        root.left = constructTree(indexMap[root_val] + 1, mid)
        root.right = constructTree(mid + 1, end)

        return root

    return constructTree(0, len(preOrder) - 1)
```