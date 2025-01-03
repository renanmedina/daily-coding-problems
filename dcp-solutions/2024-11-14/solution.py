```python
def print_spiral(matrix):
    if not matrix:
        return

    top, bottom, left, right = 0, len(matrix) - 1, 0, len(matrix[0]) - 1

    while True:
        for i in range(left, right + 1):
            print(matrix[top][i], end=' ')
        top += 1
        if top > bottom or left > right:
            break

        for i in range(top, bottom + 1):
            print(matrix[i][right], end=' ')
        right -= 1
        if top > bottom or left > right:
            break

        for i in range(right, left - 1, -1):
            print(matrix[bottom][i], end=' ')
        bottom -= 1
        if top > bottom or left > right:
            break

        for i in range(bottom, top - 1, -1):
            print(matrix[i][left], end=' ')
        left += 1
        if top > bottom or left > right:
            break

# Test the function
matrix = [
    [1, 2, 3, 4, 5],
    [6, 7, 8, 9, 10],
    [11, 12, 13, 14, 15],
    [16, 17, 18, 19, 20]
]

print_spiral(matrix)
```