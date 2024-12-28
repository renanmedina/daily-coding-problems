```markdown
package main

import (
	"container/list"
)

type ListNode struct {
	Val  int
	Next *ListNode
}

func mergeKLists(lists []ListNode) *ListNode {
	var queue list.List
	queue.PushBack(&ListNode{0, nil})
	for _, lst := range lists {
		if lst != nil {
			queue.PushBack(lst)
		}
	}

	for len(queue.Elem()) > 0 {
		current := queue.Remove()
		val := current.Val
		next := current.Next

		queue.PushBack(&ListNode{val, nil})

		for queue.Len() > 0 && queue.Front().Val < val {
			queue.Remove()
		}
	}

	return queue.First().(*ListNode)
}
```