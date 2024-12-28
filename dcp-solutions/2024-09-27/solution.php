```php
function maxSubarray($nums, $k) {
    $n = count($nums);
    if ($n == 0 || $k == 1) {
        return;
    }

    $max_values = array_fill(0, $n - $k + 1, 0);

    for ($i = 0; $i < $n - $k + 1; $i++) {
        $current_max = PHP_INT_MIN;
        for ($j = $i; $j < $i + $k; $j++) {
            $current_max = max($current_max, $nums[$j]);
        }
        $max_values[$i] = $current_max;

        print($current_max . " ");
    }

    print("\n");
}

```