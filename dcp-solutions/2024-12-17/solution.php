```php
function exist($board, $word) {
    if (empty($board)) return false;
    $m = count($board);
    $n = count($board[0]);
    $directions = [[-1, 0], [1, 0], [0, -1], [0, 1]];
    
    function dfs(&$board, $i, $j, $word, &$directions) {
        if (empty($word)) return true;
        
        if ($i < 0 || $i >= count($board) || $j < 0 || $j >= count($board[0]) || $word[0] != $board[$i][$j]) {
            return false;
        }
        
        $tmp = $board[$i][$j];
        $board[$i][$j] = '#';
        
        foreach ($directions as $direction) {
            if (dfs($board, $i + $direction[0], $j + $direction[1], substr($word, 1), $directions)) return true;
        }
        
        $board[$i][$j] = $tmp;
        return false;
    }
    
    for ($i = 0; $i < count($board); ++$i) {
        for ($j = 0; $j < count($board[0]); ++$j) {
            if (dfs($board, $i, $j, $word, $directions)) return true;
        }
    }
    
    return false;
}
```