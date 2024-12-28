```php
<?php
function minColumnsToRemove($matrix) {
    $m = count($matrix);
    if ($m == 0) {
        return 0;
    }
    $n = count($matrix[0]);
    $left = array_fill(0, $n, -1);

    for ($i = $m - 1; $i >= 0; --$i) {
        $j = min(array_keys($matrix[$i], function ($a, $b) { return $b < $a; }));
        for ($k = $j + 1; $k < $n; ++$k) {
            if ($left[$k] != -1 && $matrix[$i][$left[$k]] > $matrix[$i][$k]) {
                break;
            }
            $left[$k] = $j;
        }
    }

    return array_sum(array_map(function ($a) { return $a == -1 ? 0 : 1; }, $left));
}
?>
```