```python
def singleNumber(nums):
    ones = twos = 0
    for num in nums:
        twos |= ones & num
        ones ^= num
        threes = ones & twos
        ones &= ~threes
        twos &= ~threes
    return [num for num in (ones, twos) if num]
```