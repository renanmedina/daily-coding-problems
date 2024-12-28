```php
<?php
function trap($height) {
    if (empty($height)) return 0;
    
    $left = 0;
    $right = count($height) - 1;
    $max_left = $height[0];
    $max_right = $height[count($height) - 1];
    
    while ($left < $right) {
        if ($max_left <= $max_right) {
            $max_left = max($max_left, $height[$left]);
            $water += max(0, min($max_left, $max_right) - $height[$left]);
            $left++;
        } else {
            $max_right = max($max_right, $height[$right]);
            $water += max(0, min($max_left, $max_right) - $height[$right]);
            $right--;
        }
    }
    
    return $water;
}
?>
```