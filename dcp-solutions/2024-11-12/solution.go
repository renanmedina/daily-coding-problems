```markdown
package main

import (
    "fmt"
)

func exist(board [][]byte, word string) bool {
    rows, cols := len(board), len(board[0])
    directions := [4]int{-1, 0, 1, 0}
    for i := 0; i < rows; i++ {
        for j := 0; j < cols; j++ {
            if helper(i, j, 0, string(byte(word[0])), board) {
                return true
            }
        }
    }
    return false
}

func helper(r int, c int, ind int, w string, board [][]byte) bool {
    if r < 0 || r >= len(board) || c < 0 || c >= len(board[0]) || board[r][c] != byte(w[ind]) {
        return false
    }
    if ind == len(w)-1 {
        return true
    }
    board[r][c] = 0 // mark as visited
    for _, dr := range directions {
        if helper(r+dr, c, ind+1, w, board) {
            return true
        }
    }
    board[r][c] = byte(w[ind]) // reset mark
    return false
}

func main() {
    
}
```