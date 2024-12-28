```python
def largest_product(nums):
    nums.sort()
    n = len(nums)
    
    # Handle the case where there are four negative numbers and one positive number.
    if nums[n-1] < 0:
        return max(nums[-1]*nums[-2]*nums[-3], nums[0]*nums[1]*nums[2])
    
    # Calculate the product of three largest numbers
    return nums[n-1]*nums[n-2]*nums[n-3]
```