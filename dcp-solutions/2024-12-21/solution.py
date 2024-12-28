```python
def find_subarray(nums, k):
    left = 0
    current_sum = 0
    result = []

    for right in range(len(nums)):
        current_sum += nums[right]

        while current_sum > k and left <= right:
            current_sum -= nums[left]
            left += 1

        if current_sum == k:
            result.append(nums[left:right+1])

    return result
```