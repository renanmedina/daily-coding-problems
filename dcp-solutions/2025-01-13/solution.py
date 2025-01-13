```python
# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

class Solution:
    def findPair(self, root: TreeNode, K: int) -> (TreeNode, TreeNode):
        # Hash table to store the difference between node values and their corresponding nodes
        diff_nodes = set()
        
        # Recursive function to traverse the tree and check if a pair exists
        def find_pair(node: TreeNode, target_diff: int) -> bool:
            nonlocal diff_nodes
            
            # Base case: If the current node is None, return False
            if not node:
                return False
            
            # Calculate the difference between the current node's value and the target sum
            diff = K - node.val + target_diff
            
            # Check if this difference already exists in our hash table
            if diff in diff_nodes:
                # If it does, we found a pair!
                return True
            
            # Add the current node to the set of nodes with its difference
            diff_nodes.add(node.val)
            
            # Recursively traverse the left and right subtrees
            if find_pair(node.left, target_diff + node.val):
                return True
            if find_pair(node.right, target_diff - node.val):
                return True
            
            # If we reach this point, it means no pair was found in this subtree
            return False
        
        # Call our recursive function to start the search
        for node in [root.left, root.right]:
            if find_pair(node, 0):
                # Return the first pair found
                return (node.left if node.left else node.right, node)
        
        # If no pairs are found in the entire tree, return None
        return None
```