```markdown
package main

import (
    "errors"
    "fmt"
)

// Definition for a binary tree node.
type TreeNode struct {
    Val   int
    Left  *TreeNode
    Right *TreeNode
}

func secondHighest(root *TreeNode) (int, error) {
    if root == nil {
        return 0, errors.New("root is null")
    }

    leftMax := make(map[int]int)
    rightMax := make(map[int]int)

    var f func(*TreeNode)
    f = func(node *TreeNode) {
        if node == nil {
            return
        }
        rightMax[node.Val]++
        f(node.Left)
        f(node.Right)
    }

    f(root)

    maxFromLeft, countFromLeft := 0, 0
    for v, c := range leftMax {
        if countFromLeft < 2 {
            maxFromLeft = v
            countFromLeft += c
        } else if c > 0 {
            return v, errors.New("more than one maximum value")
        }
    }

    maxFromRight, countFromRight := 0, 0
    for v, c := range rightMax {
        if countFromRight < 2 {
            maxFromRight = v
            countFromRight += c
        } else if c > 0 {
            return -1, errors.New("more than one maximum value")
        }
    }

    // select the higher of two numbers.
    result := max(maxFromLeft, maxFromRight)
    if result == 0 {
        return 0, errors.New("no node with more than a single child exists")
    } else {
        return result, nil
    }
}
```