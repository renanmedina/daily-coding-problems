```php
function rand5() {
    $a = rand(1, 7);
    $b = rand(1, 7);
    while ($a + $b > 5) {
        $b = rand(1, 7);
    }
    return $a + $b;
}
```