```php
class Solution {
    function exist($board, $word) {
        $rows = count($board);
        $cols = count($board[0]);
        
        for ($i = 0; $i < $rows; $i++) {
            for ($j = 0; $j < $cols; $j++) {
                if (dfs($board, $word, $i, $j, 0)) {
                    return true;
                }
            }
        }
        
        return false;
    }
    
    function dfs(&$board, $word, $i, $j, $k) {
        if ($k == strlen($word)) {
            return true;
        }
        
        if ($i < 0 || $i >= count($board)) {
            return false;
        }
        if ($j < 0 || $j >= count($board[0])) {
            return false;
        }
        if ($word[$k] != $board[$i][$j]) {
            return false;
        }
        
        $temp = $board[$i][$j];
        $board[$i][$j] = '#';
        
        $found = dfs($board, $word, $i - 1, $j, $k + 1) || 
                 dfs($board, $word, $i + 1, $j, $k + 1) || 
                 dfs($board, $word, $i, $j + 1, $k + 1) || 
                 dfs($board, $word, $i, $j - 1, $k + 1);
        
        $board[$i][$j] = $temp;
        
        return $found;
    }
}
```