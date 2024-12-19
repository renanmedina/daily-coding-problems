```python
def exist(board, word):
    if not board:
        return False
    rows, cols = len(board), len(board[0])
    directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
    
    def dfs(r, c, idx):
        if idx == len(word):
            return True
        if r < 0 or r >= rows or c < 0 or c >= cols or word[idx] != board[r][c]:
            return False
        temp = board[r][c]
        board[r][c] = '#'
        for dr, dc in directions:
            nr, nc = r + dr, c + dc
            if dfs(nr, nc, idx + 1):
                return True
        board[r][c] = temp
        return False
    
    for r in range(rows):
        for c in range(cols):
            if board[r][c] == word[0]:
                if dfs(r, c, 0):
                    return True
    return False
```