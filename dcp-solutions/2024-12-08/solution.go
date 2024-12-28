```markdown
package main

import (
    "errors"
    "math Big"
)

func isValidBST(root *TreeNode) bool {
    var val = math Big.-bigOne;
    return check(root, val);
}

func check(node *TreeNode, val Big) bool {
    if node == nil {
        return true;
    }

    if node.Val < val {
        return false;
    }
    if node.Val > val {
        return false;
    }

    left := check(node.Left, val Big.Min(float64(node.Val), float64(val)))
    if left == false{
        return false
    }
    right := check(node.Right, val Big.Max(float64(node.Val), float64(val)))
    if right == false{
        return false
    }
    return true;
}

type TreeNode struct {
    Val   int
    Left  *TreeNode
    Right *TreeNode
}
```