```php
<?php
class Solution {
    function shortestPathBinaryMatrix($matrix) {
        $rows = count($matrix);
        $cols = count($matrix[0]);
        if ($rows === 0 || $cols === 0) return null;
        
        $queue = [[$rows - 1, 0] => ['steps' => 0]];
        while (!empty($queue)) {
            list($r, $c, $path) = array_shift($queue);
            if ($matrix[$r][$c]) continue;
            if (($r === 0 && $c === 0) || count($path) > 0) return $path['steps'];
            $matrix[$r][$c] = true;
            $directions = [[0,1], [0,-1], [1,0], [-1,0]];
            foreach ($directions as $dr) {
                $newR = $r + $dr[0];
                $newC = $c + $dr[1];
                if ($newR >= 0 && $newR < $rows && $newC >= 0 && $newC < $cols 
                    && !$matrix[$newR][$newC]) {
                    $queue[] = [$newR,$newC, ['steps' => count($path) + 1, 'path' => array_merge($path, [$dr])]];
                }
            }
        }
        return null;
    }
}
?>
```