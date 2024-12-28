```markdown
# Conway's Game of Life in Golang

### game_of_life.go

```go
package main

import (
    "fmt"
    "math/bits"
)

type Cell struct {
    Row   int
    Col   int
    Alive bool
}

type Board struct {
    Rows, Cols int
    Cells     []Cell
}

func NewBoard(rows, cols int) *Board {
    return &Board{
        Rows: rows,
        Cols: cols,
        Cells: make([]Cell, rows*cols),
    }
}

func (b *Board) InitializeCells(liveCoordinates [][]int) {
    for _, coordinate := range liveCoordinates {
        row := coordinate[0] % b.Rows
        col := coordinate[1] % b.Cols
        b.Cells[row*b.Cols+col].Alive = true
    }
}

func (b *Board) NextGeneration() *Board {
    newBoard := NewBoard(b_ROWS, b_COLS)
    for row := 0; row < b_ROWS; row++ {
        for col := 0; col < b_COLS; col++ {
            liveNeighbors := b.GetLiveNeighbors(row, col)
            if b.Cells[row*b.Cols+col].Alive && (liveNeighbors < 2 || liveNeighbors > 3) {
                newBoard.Cells[newBoard.Rows*newBoard.Cols+row*newBoard.Cols+col].Alive = false
            } else if !b.Cells[row*b.Cols+col].Alive && liveNeighbors == 3 {
                newBoard.Cells[newBoard.Rows*newBoard.Cols+row*newBoard.Cols+col].Alive = true
            }
        }
    }
    return newBoard
}

func (b *Board) Print() {
    for row := 0; row < b_ROWS; row++ {
        for col := 0; col < b_COLS; col++ {
            if b.Cells[row*b.Cols+col].Alive {
                fmt.Print("*")
            } else {
                fmt.Print(".")
            }
        }
        fmt.Println()
    }
}

const (
    b_ROWS = 100
    b_COLS = 100
)

func main() {
    board := NewBoard(b_ROWS, b_COLS)
    liveCoordinates := [][]int{
        {0, 0},
        {1, 1},
        {2, 2},
        // Add more coordinates here...
    }
    board.InitializeCells(liveCoordinates)

    for step := 0; step < 100; step++ {
        fmt.Println("Step:", step+1)
        board.Print()
        board = board.NextGeneration()
    }
}
```