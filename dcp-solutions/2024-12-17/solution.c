```c
#include <stdio.h>
#include <string.h>

bool exist(char** board, int **boardSize, int rows, int cols, char* word) {
    int directions[][2] = {{0,1},{-1,0},{1,0}};
    bool visited[rows][cols] = {{false}};

    for(int i=0;i<rows;i++) {
        for(int j=0;j<cols;j++) {
            if(visited[i][j]) continue;
            if(board[i][j] == '\0') continue;
            if(dfs(board, boardSize, visited, word, directions, i, j, 0)) return true;
        }
    }

    return false;
}

bool dfs(char** board, int **boardSize, bool visited[20][20], char* word, int directions[][2], int r, int c, int index) {
    if(index == strlen(word)) return true;

    if(r<0 || r>=(*boardSize)[0] || c<0 || c>=(*boardSize)[1] || visited[r][c] || board[r][c] != word[index]) {
        return false;
    }

    visited[r][c] = 1;

    for(int i=0;i<4;i++) {
        bool res = dfs(board, boardSize, visited, word, directions, r+directions[i][0], c+directions[i][1], index+1);
        if(res) return true;
    }

    visited[r][c] = 0;

    return false;
}
```