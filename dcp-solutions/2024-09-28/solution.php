```php
<?php

function minCost($cost) {
    $n = count($cost);
    $k = count($cost[0]);
    $dp = array_fill(0, $k, array_fill(0, $n, 0));
    
    for ($j = 0; $j < $k; $j++) {
        $dp[$j][0] = $cost[0][$j];
    }
        
    for ($i = 1; $i < $n; $i++) {
        for ($j = 0; $j < $k; $j++) {
            $min_val = INF;
            for ($m = 0; $m < $k; $m++) {
                if ($m != $j) {
                    $min_val = min($min_val, $dp[$m][$i-1]);
                }
            }
            $dp[$j][$i] = $cost[$i][$j] + $min_val;
        }
    }
    
    return min(array_column($dp, $n-1));
}

?>
```