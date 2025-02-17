```markdown
// Definition for a binary tree node.
type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

func longestPathLength(root *TreeNode) int {
	var dfs func(*TreeNode, int)
	dfs = func(node *TreeNode, pathLen int) int {
	    if node == nil {
	        return 0
	    }

	    left := dfs(node.Left, pathLen+1)
	    right := dfs(node.Right, pathLen+1)

	    // Update the longest length by considering paths through each child.
	    return max(left, right)+pathLen

	}
    var maxLen int = 0
    for _, n := range []TreeNode{*root} {
        maxLen = max(maxLen, dfs(&n, 0))
    }
    return maxLen
}

// Helper function to find the maximum of two values.
func max(a, b int) int {
	if a > b {
		return a
	}
	return b
}
```