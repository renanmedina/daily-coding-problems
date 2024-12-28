```php
<?php

function totalNQueens($n) {
    $column = array_fill(0, $n, 0);
    $diagonal1 = array_fill(0, 2 * $n - 1, 0);
    $diagonal2 = array_fill(0, 2 * $n - 1, 0);

    function isValid($row, $col, &$column, &$diagonal1, &$diagonal2) {
        for ($i = 0; $i < $row; $i++) {
            if ($column[$i] == $col || 
                $diagonal1[$i + $col - $n] == $col || 
                $diagonal2[$i + $col + $n - 1] == $col) {
                return false;
            }
        }

        for ($i = 0; $i < $row; $i++) {
            $diagonal1[$i + $col - $n] = $col;
            $diagonal2[$i + $col + $n - 1] = $col;
        }

        return true;
    }

    $count = 0;

    function placeQueens($row, &$column, &$diagonal1, &$diagonal2) {
        global $count;

        if ($row == $n) {
            $count++;
            return;
        }

        for ($col = 0; $col < $n; $col++) {
            if (isValid($row, $col, $column, $diagonal1, $diagonal2)) {
                $column[$row] = $col;

                placeQueens($row + 1, $column, $diagonal1, $diagonal2);
            }
        }
    }

    placeQueens(0, $column, $diagonal1, $diagonal2);

    return $count;
}

?>
```