```markdown
package main

import "container/list"

func isPalindrome(head *list.ListNode) bool {
	// Traverse both directions from the beginning and end of the list
	left := head
	right := head.Next()
	for right != nil && left != right {
		if left.Data < right.Data {
			return false
		}
		left = left.Next()
		right = right.Next()
	}

	return true
}
```