```go
// Definition for a binary tree node.
type TreeNode struct {
    Val int
    Left *TreeNode
    Right *TreeNode
}

func findTarget(root *TreeNode, k int) (*TreeNode, *TreeNode) {
    var seen map[int]*TreeNode
    var found func(*TreeNode)
    
    found = func(node *TreeNode) {
        if node == nil {
            return 
        }
        
        if seen != nil && val := seen[node.Val]; *val == node {
            return 
        }
        
        seen[ node.Val ] = node
        
        found( node.Left )
        found( node.Right )
    }

    found(root)

    for _, v := range seen {
        if diff := k - v.Val; other, ok := seen[diff]; ok && *other != v {
            return v, other
        }
    }

    return nil, nil
}
```