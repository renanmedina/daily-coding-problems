```go
func AllPaths(root *TreeNode) [][]int {
	if root == nil {
		return [][][]int{}
	}

	var paths [][]int
	var helper func(node *TreeNode, path []int)
	helper = func(node *TreeNode, path []int) {
		path = append(path, node.Val)
		if node.Left == nil && node.Right == nil {
			paths = append(paths, make([]int, len(path)))
		} else {
			if node.Left != nil {
				helper(node.Left, path)
			}
			if node.Right != nil {
				helper(node.Right, path)
			}
		}
		path = path[:len(path)-1]
	}

	helper(root, []int{})
	return paths
}
```