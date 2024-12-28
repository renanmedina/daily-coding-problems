```python
def count_inversions(array):
    def merge_sort(array):
        if len(array) <= 1:
            return array, 0
        mid = len(array) // 2
        left, left_inv = merge_sort(array[:mid])
        right, right_inv = merge_sort(array[mid:])
        merged, inv = merge(left[0], right[0])
        left_inv += right_inv
        return merged, left_inv + right_inv

    def merge(left, right):
        result = []
        i, j = 0, 0
        inv_count = 0
        while i < len(left) and j < len(right):
            if left[i] <= right[j]:
                result.append(left[i])
                i += 1
            else:
                result.append(right[j])
                j += 1
                inv_count += len(left) - i
        result.extend(left[i:])
        result.extend(right[j:])
        return result, inv_count

    return merge_sort(array)[1]
```