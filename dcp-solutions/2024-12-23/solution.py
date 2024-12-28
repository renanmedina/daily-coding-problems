```python
class Node:
    def __init__(self, val):
        self.val = val
        self.next = None
        self.prev = None

def is_palindrome(dll):
    # Create a copy of the doubly linked list to reverse it
    rev_dll = dll
    
    # Reverse the copied DLL and initialize two pointers at both ends
    while rev_dll:
        temp = rev_dll.next
        rev_dll.next = rev_dll.prev
        rev_dll.prev = temp
        rev_dll = rev_dll.next
        
    # Initialize two pointers, one from start and one from end of the DLL
    head = dll.head
    tail = dll.tail
    
    # Move both pointers towards each other until they meet
    while head and tail:
        if head.val != tail.val:
            return False
        head = head.next
        tail = tail.prev
        
    return True

class DoublyLinkedList:
    def __init__(self):
        self.head = None
        self.tail = None

def create_linked_list(lst):
    dummy = Node(0)
    dummy.next = lst[0]
    
    for i in range(1, len(lst)):
        node = Node(i)
        prev_node = dummy.next
        
        if not prev_node.next:
            prev_node.next = node
            node.prev = prev_node
            
        else:
            last_node = dll.tail
            while last_node.next.val != i:
                last_node = last_node.next
            last_node.next = node
            node.prev = last_node
            
        dummy.next = node
    dll.head = dummy.next
    dll.tail = dummy
```