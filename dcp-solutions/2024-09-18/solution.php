```php
function maxNonAdjacent($nums) {
    if (empty($nums)) return 0;
    if (count($nums) <= 2) return max($nums);

    $dp = array_fill(0, count($nums), 0);
    $dp[0] = $nums[0];
    $dp[1] = max($nums[0], $nums[1]);

    for ($i = 2; $i < count($nums); $i++) {
        $dp[$i] = max($dp[$i-1], $dp[$i-2] + $nums[$i]);
    }

    return $dp[count($nums) - 1];
}
```