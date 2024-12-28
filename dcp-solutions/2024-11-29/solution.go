```go
func deepestNode(root *TreeNode) *TreeNode {
    if root == nil {
        return nil
    }
    var depth map[*TreeNode]int
    func dfs(node *TreeNode, d int) {
        if node == nil {
            return
        }
        depth[node] = d
        dfs(node.Left, d+1)
        dfs(node.Right, d+1)
    }
    depth = make(map[*TreeNode]int)
    dfs(root, 0)
    var maxDepth int
    var res *TreeNode
    for node, d := range depth {
        if d > maxDepth {
            maxDepth = d
            res = node
        }
    }
    return res
}

type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}
```