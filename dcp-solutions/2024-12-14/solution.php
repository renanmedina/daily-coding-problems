```php
class Solution {
    public function nextPermutation($nums) {
        $n = count($nums);
        $i = $n - 2;
        
        while ($i >= 0 && $nums[$i] >= $nums[$i + 1]) {
            $i -= 1;
        }
        
        if ($i < 0) return $nums;
        
        $j = $n - 1;
        while ($nums[$j] <= $nums[$i]) {
            $j -= 1;
        }
        
        $tmp = $nums[$i];
        $nums[$i] = $nums[$j];
        $nums[$j] = $tmp;
        
        $left = $i + 1;
        $right = $n - 1;
        
        while ($left < $right) {
            $tmp = $nums[$left];
            $nums[$left] = $nums[$right];
            $nums[$right] = $tmp;
            $left += 1;
            $right -= 1;
        }
    }
}
```