```markdown
package main

import (
	"container/list"
)

type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

func pruneTree(root *TreeNode) *TreeNode {
	var deleteList list.List
	deleteList.PushBack(root)
	for deleteList.Len() > 0 {
		node := deleteList.Front().Value.(*TreeNode)
		deleteList.Remove(deleteList.Front())

		if node.Left != nil && (node.Left.Val == 1 || pruneTree(node.Left) != nil) {
			node.Left = nil
			deleteList.PushBack(node.Left)
		}

		if node.Right != nil && (node.Right.Val == 1 || pruneTree(node.Right) != nil) {
			node.Right = nil
			deleteList.PushBack(node.Right)
		}
	}

	return root
}
```