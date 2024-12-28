```python
# Definition for singly-linked list.
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

def get_intersection_node(headA, headB):
    # Calculate the length of linked list A
    len_A = 0
    temp_A = headA
    while temp_A is not None:
        len_A += 1
        temp_A = temp_A.next

    # Move pointer A to the end of its list and move pointer B by the difference in lengths
    for i in range(len_A):
        if headB is not None:
            headB = headB.next

    # At this point, both pointers are at the start of their lists. 
    # If they meet again, it will be at the intersection point.
    while headA is not None and headB is not None:
        if headA == headB:
            return headA
        headA = headA.next
        headB = headB.next

    # If no intersection point found
    return None
```