```php
function maxSubArray($nums) {
    if (empty($nums)) {
        return 0;
    }

    $max_sum = $current_sum = $nums[0];

    foreach ($nums as $num) {
        $current_sum = max($num, $current_sum + $num);
        $max_sum = max($max_sum, $current_sum);
    }

    return $max_sum;
}
```