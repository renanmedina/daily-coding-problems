```markdown
package main

import "container/list"

type ListNode struct {
	Val  int
	Next *ListNode
}

func getIntersectionNode(headA, headB *ListNode) *ListNode {
	a, b := headA, headB
	for a != b {
		if a == nil {
			a = headB
		} else if b == nil {
			b = headA
		}
		a, b = a.Next, b.Next
	}
	return a
}

func main() {

}
```