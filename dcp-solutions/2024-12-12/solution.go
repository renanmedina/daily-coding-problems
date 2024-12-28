```markdown
package main

import (
    "container/list"
    "fmt"
)

// Definition for a binary tree node.
type TreeNode struct {
    Val int
    Left *TreeNode
    Right *TreeNode
}

func maxBSTSize(root *TreeNode) (size int) {
    var dfs = func(node *TreeNode, minVal, maxVal float64) (size float64) {
        if node == nil {
            return 0.0
        }

        left := dfs(node.Left, minVal, node.Val)
        right := dfs(node.Right, node.Val, maxVal)

        if node.Val <= minVal || node.Val >= maxVal {
            return 0.0
        }

        size = max(left+right, size)
        return float64(max(left, right) + 1)
    }

    result := dfs(root, -float64('0')-1e9, float64('0')+1e9)
    if result > 0 {
        return int(result)
    } else {
        return 0
    }
}
```