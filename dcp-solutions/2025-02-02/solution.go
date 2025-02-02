```markdown
func swapPairs(head *ListNode) *ListNode {
    if head == nil || head.Next == nil {
        return head
    }
    
    newHead := head.Next
    head.Next = swapPairs(newHead.Next)
    newHead.Next = head
    
    return newHead
}
```

This solution uses a recursive approach to solve the problem. It first checks if the linked list has less than two nodes, in which case it just returns the head as there's nothing to swap. If the linked list has at least two nodes, it creates a new head by swapping the current node with the next node and then swaps the `next` pointer of the new head with the current node. The function then recursively calls itself on the rest of the linked list (i.e., the next node after the swapped pair).