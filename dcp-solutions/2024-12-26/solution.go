```markdown
package main

import (
	"container/list"
)

type TreeNode struct {
.Val int
	Left *TreeNode
	Right *TreeNode
}

func printBinaryTreeLevelWise(root *TreeNode) {
	var queue *list.List
	queue = list.New()
	if root != nil {
		queue.PushBack(root)
	}

	for queue.Len() > 0 {
		node := queue.Front()
		root = queue.Remove(node)

		if node.Left != nil {
			queue.PushBack(node.Left)
		}
		if node.Right != nil {
			queue.PushBack(node.Right)
		}

		root.Val
	}
}
```