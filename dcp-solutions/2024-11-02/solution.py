```python
def solve_sudoku(board):
    def is_valid(num, row, col):
        for i in range(9):
            if board[row][i] == num or board[i][col] == num:
                return False
        start_row = 3 * (row // 3)
        start_col = 3 * (col // 3)
        for i in range(3):
            for j in range(3):
                if board[i + start_row][j + start_col] == num:
                    return False
        return True

    def solve():
        for i in range(9):
            for j in range(9):
                if board[i][j] == 0:
                    for num in range(1, 10):
                        if is_valid(num, i, j):
                            board[i][j] = num
                            if solve():
                                return True
                            else:
                                board[i][j] = 0
                    return False
        return True

    if not solve():
        raise ValueError("No solution exists")
    return board


def print_board(board):
    for i in range(9):
        if i % 3 == 0 and i != 0:
            print("- - - - - - - - - - - -")
        for j in range(9):
            if j % 3 == 0 and j != 0:
                sys.stdout.write("| ")
            if j == 8:
                sys.stdout.write(str(board[i][j]) + "\n")
            else:
                sys.stdout.write(str(board[i][j]) + " ")
```