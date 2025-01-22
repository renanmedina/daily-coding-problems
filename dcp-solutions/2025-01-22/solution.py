```python
class SparseArray:
    class Node:
        def __init__(self, start):
            self.start = start
            self.end = None
            self.val = 0
            self.left = None
            self.right = None

    def __init__(self, arr, size):
        self.root = None
        self.size = size
        self.num_elements = sum(1 for x in arr if x != 0)
        
        if self.num_elements == 0:
            return
        
        start = 0
        while True:
            if start >= self.size or arr[start] == 0:
                break
            
            node = self.Node(start)
            start += 1

            if not self.root:
                self.root = node
                end = start - 1
            else:
                current = self.root
                while current.end < start and current.end < size:
                    current = current.right
                
                if current.end < start:
                    new_node = self.Node(start)
                    current.right = new_node
                    new_node.left = current
                    end = start
                    
                end += 1
                node.end = end

    def set(self, i, val):
        new_val = val
        current = self.root
        while True:
            if not current or i < current.start or i > current.end:
                return
            
            if val != new_val:
                if not current.left and not current.right:
                    current.val = new_val
                elif current.left and current.right:
                    left_val = current.left.val
                    right_val = current.right.val
                    
                    if left_val == new_val:
                        current.left.val = new_val
                    elif right_val == new_val:
                        current.right.val = new_val
                    else:
                        # Split the node in half
                        mid = (current.start + current.end) // 2
                        node_left = self.Node(current.start)
                        node_right = self.Node(mid)
                        
                        node_left.right = current
                        node_right.left = current
                        node_left.val = left_val
                        node_right.val = right_val
                        
                        # Update the parent to be the new root
                        if not self.root:
                            self.root = node_left
                        else:
                            # Find the parent of the old root
                            parent = self.find_parent(self.root)
                            if parent.right == current:
                                parent.right = node_left
                            elif parent.left == current:
                                parent.left = node_left
                            
                        # Reassign current to be the right child of its parent's sibling
                        current = None
                        left_child = parent.left
                        if left_child:
                            current = left_child.right
                        else:
                            current = parent.left

            i += 1
            current = current.next

    def get(self, i):
        current = self.root
        while True:
            if not current or i < current.start or i > current.end:
                return -1
            
            if i == current.start:
                return current.val
            else:
                current = current.next
```