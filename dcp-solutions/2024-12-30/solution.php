```php
function findAnagrams($W, $S) {
    if (strlen($W) > strlen($S)) {
        return [];
    }

    $W_count = array_count_values(str_split($W));
    $result = [];

    foreach (str_split($S) as $i => $char) {
        if ($i >= count($W)) {
            continue;
        }
        if (!isset($W_count[$char])) {
            continue;
        }
        $W_count[$char]--;
        
        if (empty($W_count)) {
            $result[] = $i;
        }
    }

    return $result;
}
```