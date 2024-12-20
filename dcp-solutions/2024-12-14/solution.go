```go
func nextGreaterElements(nums []int) []int {
    n := len(nums)
    nums = append(nums, nums...)
    for i := 0; i < 2*n-1; i++ {
        j := (i + 1) % n
        if nums[j] > nums[i] {
            left := i + 1
            right := n - 1
            for ; nums[right] <= nums[j]; right-- {
                }
            nums[left], nums[right] = nums[right], nums[left]
            left += 1
            right -= 1
            while left < right {
                nums[left], nums[right] = nums[right], nums[left]
                left++
                right--
            }
            break
        }
    }
    return nums[:n]
}
```