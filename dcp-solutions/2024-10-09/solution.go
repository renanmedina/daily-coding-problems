```go
func trap(height []int) int {
    n := len(height)
    left, right := 0, n-1
    maxLeft, maxRight := height[0], height[n-1]
    water := 0

    for left < right {
        if maxLeft >= maxRight {
            maxLeft = height[left]
            left++
        } else {
            maxRight = height[right]
            right--
        }
        water += max(maxLeft-maxRight, 0)
    }

    return water
}
```