```markdown
// Solution
func exist(board [][]byte) bool {
    m, n := len(board), len(board[0])
    directions := [4]int{{-1, 0}, {1, 0}, {0, -1}, {0, 1}}

    for i := 0; i < m; i++ {
        for j := 0; j < n; j++ {
            if board[i][j] != '.' && search(board, i, j, string(board[i][j]), directions) {
                return true
            }
        }
    }

    return false
}

func search(board [][]byte, i, j int, word string, directions []int) bool {
    m, n := len(board), len(board[0])
    if len(word) == 0 || i < 0 || i >= m || j < 0 || j >= n || board[i][j] != byte(word[0]) {
        return false
    }

    temp := board[i][j]
    board[i][j] = '.'

    for _, d := range directions {
        if search(board, i+d[i], j+d[j], word[1:], directions) {
            return true
        }
    }

    board[i][j] = temp

    return false
}
```