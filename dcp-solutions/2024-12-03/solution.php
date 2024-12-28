```php
<?php
function numIslands($matrix) {
    if (empty($matrix)) {
        return 0;
    }

    $rows = count($matrix);
    $cols = count($matrix[0]);
    $island_count = 0;

    for ($r = 0; $r < $rows; $r++) {
        for ($c = 0; $c < $cols; $c++) {
            if ($matrix[$r][$c] == '1') {
                dfs($matrix, $r, $c);
                $island_count++;
            }
        }
    }

    return $island_count;
}

function dfs(&$matrix, $r, $c) {
    if ($r < 0 || $c < 0 || $r >= count($matrix) || $c >= count($matrix[0]) || $matrix[$r][$c] == '0') {
        return;
    }

    $matrix[$r][$c] = '0';

    dfs($matrix, $r - 1, $c);
    dfs($matrix, $r + 1, $c);
    dfs($matrix, $r, $c - 1);
    dfs($matrix, $r, $c + 1);
}
```