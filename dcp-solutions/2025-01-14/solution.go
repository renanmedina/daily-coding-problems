```go
func rotateList(nums []int, k int) {
    if len(nums) == 0 || k == 0 {
        return
    }

    n := len(nums)
    k = k % n
    reversed := false
    for i := 1; i < k/2 + 1; i++ {
        tmp := nums[i-1]
        nums[i-1] = nums[k+i-1]
        nums[k+i-1] = tmp

        if i == k/2 {
            reversed = !reversed
        }
    }

    if reversed {
        for i := 0; i < n/2; i++ {
            tmp := nums[i]
            nums[i] = nums[n-i-1]
            nums[n-i-1] = tmp
        }
    }
}
```