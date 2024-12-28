```python
def can_jump(nums):
    max_reach = 0
    last_pos = 0
    
    for i in range(len(nums)):
        if i > max_reach:
            return False
        max_reach = max(max_reach, i + nums[i])
    
    return True
```