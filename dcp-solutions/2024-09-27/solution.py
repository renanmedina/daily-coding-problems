```python
def maxSubarrayLength(nums, k):
    if not nums:
        return []

    max_sum = [0] * len(nums)
    max_sum[0] = nums[0]

    for i in range(1, k):
        max_sum[i] = max(max_sum[i-1], nums[i])

    for i in range(k, len(nums)):
        max_sum[i-k+1] = max(max_sum[i-k], sum(nums[i-k+1:i+1]))
        
        print(max_sum[i], end=" ")

# Test the function
maxSubarrayLength([10, 5, 2, 7, 8, 7], 3)
```