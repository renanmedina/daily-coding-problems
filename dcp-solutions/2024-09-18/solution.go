```go
func maxNonAdjacent(nums []int) int {
    if len(nums) == 0 {
        return 0
    } else if len(nums) <= 2 {
        return max(nums[0], nums[1])
    }

    prev, curr := nums[0], nums[1]
    for i := 2; i < len(nums); i++ {
        temp := curr
        curr = max(prev + nums[i], curr)
        prev = temp
    }

    return curr
}

func max(a, b int) int {
    if a > b {
        return a
    }
    return b
}
```