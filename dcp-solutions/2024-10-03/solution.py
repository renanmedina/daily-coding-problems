```python
class Node:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right
        self.locked = False

    def is_locked(self):
        """Check if the node or any of its ancestors are locked"""
        if not self:
            return True  # empty tree is considered locked
        return self.locked or (self.left and self.left.is_locked()) or (self.right and self.right.is_locked())

    def lock(self):
        """Attempt to lock the node, returns False if cannot be locked"""
        if not self:
            return False
        if not self.is_locked():
            return False  # already locked
        self.locked = True
        return True

    def unlock(self):
        """Unlock the node, returns False if cannot be unlocked"""
        if not self:
            return False
        if not self.locked:
            return False  # already unlocked
        self.locked = False
        return True
```