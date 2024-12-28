```php
class Solution {
    function search($nums, $target) {
        if (empty($nums)) return null;

        $left = 0;
        $right = count($nums) - 1;

        while ($left <= $right) {
            $mid = floor(($left + $right) / 2);

            if ($nums[$mid] == $target) return $mid;

            // Determine the left and right bound of the search space
            if ($nums[$left] <= $nums[$mid]) {
                if ($nums[$left] <= $target && $target < $nums[$mid])
                    $right = $mid - 1;
                else
                    $left = $mid + 1;
            } else {
                if ($nums[$mid] < $target && $target <= $nums[$right])
                    $left = $mid + 1;
                else
                    $right = $mid - 1;
            }
        }

        return null;
    }
}
```