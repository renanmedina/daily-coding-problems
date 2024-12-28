```markdown
// Definition for a binary tree node.
type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

func maxPathSum(root *TreeNode) int {
	var res int64 = -1_64
	var maxGain func(node *TreeNode)
	maxGain = func(node *TreeNode) {
		if node == nil {
			return
		}
		maxL := int64(-1e18)
		maxR := int64(-1e18)
		if node.Left != nil {
			l := maxPathSum(node.Left)
			maxL = max(maxL, l+int64(node.Val))
		}
		if node.Right != nil {
			r := maxPathSum(node.Right)
			maxR = max(maxR, r+int64(node.Val))
		}
		res = max(res, int64(max(maxL, maxR)))
		return int64(max(maxL, maxR) + int64(node.Val))
	}
	maxGain(root)
	return int(res)
}

```