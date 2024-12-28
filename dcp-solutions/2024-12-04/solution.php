```php
function majorityElement($x, $y, $b) {
    if ($b == 1) {
        return $x;
    } elseif ($b == 0) {
        return $x ^ $y;
    }
}
```