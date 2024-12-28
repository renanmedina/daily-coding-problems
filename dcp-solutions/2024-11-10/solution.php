```php
function myPow($x, $y) {
    if ($x == 0) return 0;
    
    $result = 1;
    $abs_y = abs($y);
    
    while ($abs_y > 0) {
        if (($abs_y & 1) == 1)
            $result *= $x;
        
        $x *= $x;
        $abs_y >>= 1;
    }
    
    return ($y < 0) ? (1 / $result) : $result;
}
```