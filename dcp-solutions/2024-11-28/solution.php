```php
function canBeNonDecreasing($nums) {
    $increases = 0;
    for ($i = 1; $i < count($nums); $i++) {
        if ($nums[$i] > $nums[$i-1]) {
            $increases++;
            if ($increases > 1) {
                return false;
            }
        }
    }
    return true;
}
```