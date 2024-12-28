```php
function isMatch($s, $p) {
    $dp = array_fill(0, strlen($s) + 1, array_fill(0, strlen($p) + 1, false));
    $dp[strlen($s)][strlen($p)] = true;
    
    for ($i = strlen($s); $i >= 0; $i--) {
        for ($j = strlen($p) - 1; $j >= 0; $j--) {
            if ($p[$j] == '.') {
                $dp[$i][$j] = $dp[$i + 1][$j + 1];
            } elseif ($p[$j] == '*') {
                if (empty($s) || $s[0] == $p[$j + 1]) {
                    $dp[$i][$j] = $dp[$i][($j - 2 >= 0) ? $j - 2 : -1];
                }
            } else {
                if ($i < strlen($s) && $s[$i] == $p[$j]) {
                    $dp[$i][$j] = $dp[$i + 1][$j + 1];
                }
            }
        }
    }

    return $dp[0][0];
}
```