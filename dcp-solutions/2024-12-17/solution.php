```php
function exist($board, $word) {
    if (empty($board)) {
        return false;
    }

    foreach ($board as &$row) {
        for ($i = 0; $i < count($row); ++$i) {
            if (dfs($row, $i, 0, $board, $word)) {
                return true;
            }
        }
    }

    return false;

    function dfs(&$grid, $i, $j, &$board, $word) {
        if ($i < 0 || $i >= count($grid) || $j < 0 || $j >= count($grid[0]) || $grid[$i][$j] != $word[0]) {
            return false;
        }

        $tmp = $grid[$i][$j];
        $grid[$i][$j] = '#';

        if (strlen($word) == 1) {
            return true;
        }

        $res = dfs($grid, $i + 1, $j, $board, substr($word, 1));
        if (!$res) {
            $res = dfs($grid, $i - 1, $j, $board, substr($word, 1));
        }
        if (!$res) {
            $res = dfs($grid, $i, $j + 1, $board, substr($word, 1));
        }
        if (!$res) {
            $res = dfs($grid, $i, $j - 1, $board, substr($word, 1));
        }

        $grid[$i][$j] = $tmp;
        return $res;
    }
}
```