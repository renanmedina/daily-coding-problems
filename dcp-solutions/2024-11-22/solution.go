```markdown
func reverseList(head *ListNode) *ListNode {
    prev := nil
    current := head
    for current != nil {
        nextNode := current.Next
        current.Next = prev
        prev = current
        current = nextNode
    }
    return prev
}
```