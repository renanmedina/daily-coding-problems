```go
package main

import (
    "sort"
)

func largestProduct(nums []int) int {
    sort.Ints(nums)
    return max(nums[0]*nums[1]*nums[n-1], nums[n-2]*nums[n-3]*nums[-1])
}

func max(a, b int) int {
    if a > b {
        return a
    }
    return b
}
```