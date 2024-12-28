```php
function min_removals($s) {
    $stack = array();
    $count = 0;
    for ($i = 0; $i < strlen($s); $i++) {
        if ($s[$i] == '(') {
            array_push($stack, $s[$i]);
        } else {
            if (!empty($stack)) {
                array_pop($stack);
            } else {
                $count++;
            }
        }
    }
    return $count + count($stack);
}
```