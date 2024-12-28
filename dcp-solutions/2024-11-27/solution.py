### Merge K Sorted Linked Lists
```python
# Definition for singly-linked list.
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution:
    def mergeKLists(self, lists):
        # Create a min heap to store the nodes from the linked lists
        min_heap = []
        
        # Add the head of each linked list to the min heap
        for node in lists:
            if node:
                min_heap.append((node.val, id(node), 0))  # (val, node_id, index)
                self._heapify(min_heap)

        # Create a dummy node to serve as the start of the merged linked list
        dummy = ListNode(0)
        current = dummy

        while len(min_heap) > 0:
            val, node_id, index = heappop(min_heap)
            current.next = lists[node_id]
            current = current.next
            
            # Add the next node from the same linked list to the min heap
            if lists[node_id].next:
                heappush(min_heap, (lists[node_id].next.val, id(lists[node_id].next), index + 1))
        
        return dummy.next
```
Note: The `_heapify` function is not shown here as it's not a standard Python function and can be achieved using the `heapq.heapify` function in Python.