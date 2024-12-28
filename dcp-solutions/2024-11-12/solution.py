```python
def exist(board, word):
    rows, cols = len(board), len(board[0])
    directions = [(0, 1), (1, 0)]
    
    def dfs(r, c, i):
        if i == len(word): return True
        if r < 0 or r >= rows or c < 0 or c >= cols or word[i] != board[r][c]: return False
        tmp = board[r][c]
        board[r][c] = '#'
        
        for dr, dc in directions:
            if dfs(r + dr, c + dc, i + 1):
                return True
        
        board[r][c] = tmp
        return False

    for r in range(rows):
        for c in range(cols):
            if dfs(r, c, 0): 
                return True
    
    return False
```