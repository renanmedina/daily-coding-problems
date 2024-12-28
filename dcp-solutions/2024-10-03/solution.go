```markdown
// Definition for a binary tree node.
type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

func NodeVal(v interface{}) *TreeNode {
	return &TreeNode{Val: v}
}

type LockingTree struct {
	root *TreeNode
}

func (lt *LockingTree) dfs(node *TreeNode, locked map[*TreeNode]bool) bool {
	if node == nil {
		return false
	}
	locked[node] = true

	if !lt.dfs(node.Left, locked) || !lt.dfs(node.Right, locked) {
		return false
	}

	return true
}

func (lt *LockingTree) isLocked(node *TreeNode) bool {
	return node != nil && node.Val != 0
}

func (lt *LockingTree) lock(node *TreeNode) bool {
	if lt.isLocked(node) {
		return false
	}

	if lt.dfs(node, map[*TreeNode]bool{}) == false {
		node.Val = 1 // 0 for unlocked and positive value if locked
		return true
	}

	return false
}

func (lt *LockingTree) unlock(node *TreeNode) bool {
	if lt.isLocked(node) {
		return false
	}

	if node.Val != 0 {
		node.Val = 0
		return true
	}

	return false
}
```