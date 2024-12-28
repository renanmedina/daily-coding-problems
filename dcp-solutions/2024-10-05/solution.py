```python
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

def removeNthFromEnd(head, n):
    # if list has only one node
    if not head or not head.next:
        return None
    
    # two pointers, first pointer is always ahead of the second by k nodes
    lead = head
    tail = head
    for i in range(n + 1):
        if not lead.next:
            break
        lead = lead.next
        
    # remove nth from end node
    if not lead.next:  
        return None
    else:
        while lead.next.next:
            lead = lead.next 
            tail = tail.next    
        tail.next = tail.next.next   
    return head
```