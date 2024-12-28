```php
<?php

function count_attacking_bishops($M, $bishops) {
    $diagonal_count = array();
    
    foreach ($bishops as $bishop1) {
        list($r1, $c1) = $bishop1;
        
        for ($i = 0; $i < $M; $i++) {
            for ($j = $i + abs($r1 - $i); $j !== null && $j !== $i + $abs($c1 - $j); $j += (abs($r1 - $i) == abs($c1 - $j) ? 1 : -1)) {
                list($r2, $c2) = [$i, $j];
                
                if (!isset($diagonal_count[$r2 . ',' . $c2])) {
                    continue;
                }
                
                if ($diagonal_count[$r2 . ',' . $c2] !== null && in_array($bishop1, $bishops)) {
                    $key = implode(',', [$bishop1[0], $bishop1[1]]);
                    if (!isset($diagonal_count[$key])) {
                        $diagonal_count[$key] = 1;
                    } else {
                        $diagonal_count[$key]++;
                    }
                }
            }
        }
    }
    
    $total_pairs = 0;
    foreach ($bishops as $i => $bishop1) {
        list($r1, $c1) = $bishop1;
        
        for ($j = $i + 1; $j < count($bishops); $j++) {
            list($r2, $c2) = $bishops[$j];
            
            if ((abs($r1 - $r2)) !== (abs($c1 - $c2))) {
                continue;
            }
            
            $key = implode(',', [$bishop1[0], $bishop1[1]]);
            $total_pairs += $diagonal_count[$key] ?? 0;
        }
    }
    
    return $total_pairs / 2;
}

?>
```