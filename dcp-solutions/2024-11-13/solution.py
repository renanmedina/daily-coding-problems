```python
def numKnightTours(N):
    # Initialize all positions as -1 (not visited)
    board = [-1] * (N ** 2)

    # Initialize possible moves
    moves = [(2, 1), (1, 2), (-1, 2), (-2, 1), (-2, -1), (-1, -2), (1, -2), (2, -1)]

    def is_valid(x, y):
        return 0 <= x < N and 0 <= y < N

    def dfs(x, y, step):
        if step == N ** 2:
            return 1
        count = 0
        for dx, dy in moves:
            nx, ny = x + dx, y + dy
            if is_valid(nx, ny) and board[nx * N + ny] == -1:
                board[nx * N + ny] = step
                count += dfs(nx, ny, step + 1)
                board[nx * N + ny] = -1
        return count

    return dfs(0, 0, 1) % 1000000007
```