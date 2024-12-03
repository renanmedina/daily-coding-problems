package main

import "fmt"

type WorldMapGrid [][]int

func main() {
	worldmap := WorldMapGrid{
		{1, 0, 0, 0, 0},
		{0, 0, 1, 1, 0},
		{0, 1, 1, 0, 0},
		{0, 0, 0, 0, 0},
		{1, 1, 0, 0, 1},
		{1, 1, 0, 0, 1},
	}

	islands_count := count_islands(worldmap)
	message := fmt.Sprintf("The matrix provided has %d islands", islands_count)
	fmt.Println(message)
}

func count_islands(grid WorldMapGrid) int {
	rows_count := len(grid)
	if rows_count == 0 {
		return 0
	}

	columns_count := len(grid[0])

	if columns_count == 0 {
		return 0
	}

	island_count := 0

	for row := range rows_count {
		for col := range columns_count {
			// found an island piece
			if grid[row][col] == 1 {
				island_count += 1
				dfs(grid, row, col, rows_count, columns_count)
			}
		}
	}

	return island_count
}

func dfs(grid WorldMapGrid, row int, col int, totalRows int, totalColumns int) {
	if row < 0 || col < 0 || row >= totalRows || col >= totalColumns || grid[row][col] == 0 {
		return
	}

	grid[row][col] = 0
	dfs(grid, row-1, col, totalRows, totalColumns) // check up positions
	dfs(grid, row+1, col, totalRows, totalColumns) // check down positions
	dfs(grid, row, col+1, totalRows, totalColumns) // check right positions
	dfs(grid, row, col-1, totalRows, totalColumns) // check left positions
}
