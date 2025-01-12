```php
<?php

function expected_rounds($n) {
    if ($n == 1) {
        return 0;
    }

    $expected_value = array_fill(0, $n + 1, PHP_INT_MAX);
    $expected_value[1] = 0;

    for ($i = 2; $i <= $n; $i++) {
        $expected_value[$i] = (int) (($i * $i - $i) / 2) + $expected_value[(int)($i/2)];
    }

    return $expected_value[$n];
}

?>
```