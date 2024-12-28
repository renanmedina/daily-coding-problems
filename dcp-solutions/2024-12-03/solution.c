```c
#include <stdio.h>

int numIslands(char** grid, int gridSize, int* gridColSize) {
    if (!grid || !grid[0]) return 0;
    int islands = 0;
    for (int i = 0; i < gridSize; ++i) {
        for (int j = 0; j < *gridColSize; ++j) {
            if (grid[i][j] == '1') {
                islands++;
                dfs(grid, i, j);
            }
        }
    }
    return islands;
}

void dfs(char** grid, int row, int col) {
    if (row >= 0 && row < *gridSize && col >= 0 && col < *gridColSize && grid[row][col] == '1') {
        grid[row][col] = '0';
        dfs(grid, row + 1, col);
        dfs(grid, row - 1, col);
        dfs(grid, row, col + 1);
        dfs(grid, row, col - 1);
    }
}
```