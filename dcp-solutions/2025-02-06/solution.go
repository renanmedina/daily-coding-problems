```markdown
package main

import (
    "fmt"
)

type NumArray struct {
    tree []int32
}

func (n *NumArray) sum(i, j int) int {
    res := 0
    i--
    j--

    for low, high := i, j; low <= high; low++ {
        res += n.tree[low]
    }

    for low, high = i+1, j-1; low <= high; low++ {
        res += n.tree[low]
    }

    return int(res)
}

func (n *NumArray) build(nums []int) {
    size := len(nums)
    n.tree = make([]int32, size*4)

    for i := 0; i < size; i++ {
        n.buildHelper(i, i+1, 0, size-1, nums[i])
    }
}

func (n *NumArray) buildHelper(low, high int, tl, tr int, val int) {
    if low == tl && high == tr {
        n.tree[tl] = int32(val)
    } else {
        mid := (low + high) / 2
        if tl <= mid {
            n.buildHelper(tl, mid, tl, mid, val)
        }
        if mid+1 <= tr {
            n.buildHelper(mid+1, tr, mid+1, tr, val)
        }

        merge(n.tree[tl], n.tree[mid+1])
    }
}

func (n *NumArray) update(i int, val int) {
    i--
    n.updateHelper(i, 0, len(n.tree)-1, val)
}

func (n *NumArray) updateHelper(low, high int, idx int, val int) {
    if low == high {
        n.tree[idx] = int32(val)
    } else {
        mid := (low + high) / 2
        if low <= mid && idx <= mid {
            n.updateHelper(low, mid, idx, val)
        } else if mid+1 <= high {
            n.updateHelper(mid+1, high, idx, val)
        }

        merge(n.tree[low], n.tree[mid+1])
    }
}

func merge(a, b int32) {
    a += b
    if a > 2147483647 {
        a -= 4294967296
    }
    b += a
    if b > 2147483647 {
        b -= 4294967296
    }

    n.tree[0] = min(a, b)
}

func main() {}
```