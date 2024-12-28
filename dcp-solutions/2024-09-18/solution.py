```python
def largest_sum_of_non_adjacent(numbers):
    if not numbers:
        return 0
    elif len(numbers) <= 2:
        return max(0, max(numbers))

    incl = [0] * len(numbers)
    excl = [0] * len(numbers)

    incl[0] = max(0, numbers[0])
    excl[0] = 0

    for i in range(1, len(numbers)):
        incl[i] = max(incl[i-1], excl[i-1] + numbers[i])
        excl[i] = max(excl[i-1], incl[i-1])

    return max(incl[-1], excl[-1])
```