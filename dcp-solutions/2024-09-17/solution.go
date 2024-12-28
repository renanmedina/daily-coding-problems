```markdown
package main

import "container/list"

type TreeNode struct {
	Val int
	Left *TreeNode
	Right *TreeNode
}

func countUnivalSubtrees(root *TreeNode) int {
	var count int
	var dfs func(*TreeNode)
	
	dfs = func(node *TreeNode) {
		if node == nil {
			return 
		}
		
		left := true
		right := true
		var l, r []int
		var stack container.List
		
		stack.PushBack(node, 0)
		
		for !stack.IsEmpty() {
			curr := stack.Front().Value.(TreeNode)
			stack.Remove(stack.Front())
			
			l = append(l, curr.Val)
			r = append(r, curr.Val)
			left &= curr.Val == curr.Left.Val
			right &= curr.Val == curr.Right.Val
            
			if curr.Left != nil {
				stack.PushBack(curr.Left, 1)
			}
			if curr.Right != nil {
				stack.PushBack(curr.Right, 0)
			}
			
		}

		if left && right {
			count++
		}
		
		for len(l) > 1 {
			mid := (len(l)-1)/2
			dfs(&TreeNode{Val: l[mid], Left: &TreeNode{Val: l[mid]}, Right: &TreeNode{Val: r[mid]}})
			l = l[:mid]
			r = r[mid+1:]
		}
		
		for len(r) > 1 {
			mid := (len(r)-1)/2
			dfs(&TreeNode{Val: l[mid], Left: &TreeNode{Val: r[mid]}, Right: &TreeNode{Val: r[mid+1]}})
			l = l[mid+1:]
			r = r[:mid]
		}
	}

	dfs(root)
	return count
}
```