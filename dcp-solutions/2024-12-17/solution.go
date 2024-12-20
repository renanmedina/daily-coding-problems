```markdown
package main

import (
    "errors"
    "fmt"
)

func exist(board [][]byte, word string) bool {
    m, n := len(board), len(board[0])
    dirs := []struct{ dx, dy int }{{-1, 0}, {1, 0}, {0, -1}, {0, 1}}

    var dfs(i, j int, k int) bool {
        if k == len(word)-1 {
            return true
        }
        if i < 0 || i >= m || j < 0 || j >= n || board[i][j] != word[k] {
            return false
        }
        temp := board[i][j]
        board[i][j] = '#'
        for _, dir := range dirs {
            if dfs(i+dir.dx, j+dir.dy, k+1) {
                return true
            }
        }
        board[i][j] = temp
        return false
    }

    for i := 0; i < m; i++ {
        for j := 0; j < n; j++ {
            if dfs(i, j, 0) {
                return true
            }
        }
    }
    return false
}
```