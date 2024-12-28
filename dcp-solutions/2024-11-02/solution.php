```php
<?php

function isValid($board, $row, $col, $num) {
    // Check the row
    for ($x = 0; $x < 9; $x++) {
        if ($board[$row][$x] == $num) {
            return false;
        }
    }

    // Check the column
    for ($x = 0; $x < 9; $x++) {
        if ($board[$x][$col] == $num) {
            return false;
        }
    }

    // Check the box
    $startRow = $row - $row % 3;
    $startCol = $col - $col % 3;
    for ($i = 0; $i < 3; $i++) {
        for ($j = 0; $j < 3; $j++) {
            if ($board[$i + $startRow][$j + $startCol] == $num) {
                return false;
            }
        }
    }

    // Number is valid
    return true;
}

function solveSudoku(&$board) {
    for ($i = 0; $i < 9; $i++) {
        for ($j = 0; $j < 9; $j++) {
            if ($board[$i][$j] == 0) {
                for ($num = 1; $num <= 9; $num++) {
                    if (isValid($board, $i, $j, $num)) {
                        $board[$i][$j] = $num;
                        if (solveSudoku($board)) {
                            return true;
                        }
                        $board[$i][$j] = 0;
                    }
                }
                return false; // No more numbers can be placed
            }
        }
    }

    // Sudoku is solved
    return true;
}

function printBoard($board) {
    for ($i = 0; $i < 9; $i++) {
        if ($i % 3 == 0 && $i != 0) {
            echo "- - - - - - - - - - -\n";
        }
        for ($j = 0; $j < 9; $j++) {
            if ($j % 3 == 0 && $j != 0) {
                echo "| ";
            }
            if ($j == 8) {
                echo $board[$i][$j] . "\n";
            } else {
                echo $board[$i][$j] . " ";
            }
        }
    }
}

?>
```