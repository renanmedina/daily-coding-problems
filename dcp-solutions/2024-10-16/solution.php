```php
function power_set($s) {
    $result = [[]];
    foreach ($s as $x) {
        $new_subsets = [];
        foreach ($result as $subset) {
            array_unshift($new_subsets, array_merge($subset, [$x]));
            $new_subsets[] = $subset;
        }
        $result = array_unique($new_subsets);
    }
    return $result;
}
```