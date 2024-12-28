```php
function countInversions($nums) {
    $left = 0;
    $right = count($nums) - 1;
    $result = 0;

    while ($left < $right) {
        $i = $left;
        $j = $right;
        while ($i < $j) {
            if ($nums[$i] <= $nums[$j]) {
                $i += 1;
            } else {
                $result += count($nums) - $i;
                $j -= 1;
            }
        }
    }

    return $result;
}
```