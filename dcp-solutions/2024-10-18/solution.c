```c
#include <stdio.h>
#include <stdlib.h>

#define INF 1000000

// Structure to represent the board state
typedef struct {
    int rows;
    int cols;
} Board;

// Function to check if a cell is alive at a given position
int is_alive(const Board* board, int row, int col) {
    for (int i = -1; i <= 1; i++) {
        for (int j = -1; j <= 1; j++) {
            int r = row + i;
            int c = col + j;
            if (i == 0 && j == 0)
                continue;

            int nr = (r + board->rows) % board->rows;
            int nc = (c + board->cols) % board->cols;
            if (nr < 0 || nc < 0)
                continue;

            if (board->grid[nr][nc] == 1)
                return 1;
        }
    }

    // Cell is not alive and has no live neighbors, so it dies
    return 0;
}

// Function to count the number of live neighbors for a given cell
int count_neighbors(const Board* board, int row, int col) {
    int count = 0;
    for (int i = -1; i <= 1; i++) {
        for (int j = -1; j <= 1; j++) {
            int r = row + i;
            int c = col + j;
            if (i == 0 && j == 0)
                continue;

            int nr = (r + board->rows) % board->rows;
            int nc = (c + board->cols) % board->cols;
            if (nr < 0 || nc < 0)
                continue;

            if (board->grid[nr][nc] == 1)
                count++;
        }
    }

    return count;
}

// Function to update the cell state based on its neighbors
int update_cell(const Board* board, int row, int col) {
    int live_neighbors = count_neighbors(board, row, col);
    if (board->grid[row][col] == 1 && (live_neighbors < 2 || live_neighbors > 3))
        return 0;
    else if (board->grid[row][col] == 0 && live_neighbors == 3)
        return 1;

    // Cell state remains the same
    return board->grid[row][col];
}

// Function to print the current state of the board
void print_board(const Board* board) {
    for (int row = 0; row < board->rows; row++) {
        for (int col = 0; col < board->cols; col++) {
            if (board->grid[row][col] == 1)
                printf("* ");
            else
                printf(". ");
        }
        printf("\n");
    }
}

// Function to run the Game of Life simulation
void game_of_life(const Board* board, int steps) {
    for (int step = 0; step < steps; step++) {
        // Create a copy of the current state to avoid modifying it directly
        Board new_board;
        new_board.rows = board->rows;
        new_board.cols = board->cols;
        new_board.grid = (int*)malloc(new_board.rows * new_board.cols * sizeof(int));
        for (int i = 0; i < new_board.rows; i++) {
            for (int j = 0; j < new_board.cols; j++)
                new_board.grid[i * new_board.cols + j] = update_cell(board, i, j);
        }

        // Check if the board is not infinite
        if (new_board.rows == INF && new_board.cols == INF) {
            int row = step % (new_board.rows - 1) + 1;
            int col = step % (new_board.cols - 1) + 1;

            // Print the top-leftmost live cell at each step
            while (row <= new_board.rows && col <= new_board.cols)
                print_board(&new_board), printf("\n"), row++, col++;
        }
        else {
            for (int i = 0; i < new_board.rows * new_board.cols; i++)
                new_board.grid[i] = update_cell(board, i / new_board.cols, i % new_board.cols);

            // Print the current state of the board
            print_board(&new_board);
        }

        // Update the original board for the next step
        free(board->grid);
        board->grid = new_board.grid;
    }
}

// Function to initialize a new game with a starting list of live cell coordinates and steps
void init_game(Board* board, int rows, int cols, int* start_alive, int num_start_alive) {
    if (rows == INF && cols == INF)
        board->rows = rows - 1;
    else
        board->rows = rows;

    if (cols == INF && rows != INF)
        board->cols = cols - 1;
    else
        board->cols = cols;

    board->grid = (int*)malloc(board->rows * board->cols * sizeof(int));
    for (int i = 0; i < num_start_alive; i++) {
        int row, col;
        start_alive(i) ? (row = start_alive[i] / cols) : 0,
                        start_alive(i + num_start_alive) ? (col = start_alive[i + num_start_alive] % cols) : board->cols - 1;

        if (row < board->rows && row >= 0)
            if (col < board->cols && col >= 0)
                board->grid[row * board->cols + col] = 1;
    }
}

int main() {
    Board game_of_life_board;
    int rows = 10, cols = 10;
    init_game(&game_of_life_board, INF, INF, NULL, 0);

    for (int step = 0; step < 100; step++) {
        game_of_life(&game_of_life_board, 1);
    }

    return 0;
}
```