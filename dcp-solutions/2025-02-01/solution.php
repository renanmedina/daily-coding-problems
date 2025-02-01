### PHP Solution

```php
function nextGreaterElement($nums, $n) {
    $stack = [];
    $map = [];

    foreach ($nums as $i => $num) {
        while (!empty($stack) && end($stack) <= $num) {
            array_pop($stack);
        }

        if (empty($stack)) {
            $map[$i] = null;
        } else {
            $map[$i] = end($stack);
        }

        array_push($stack, $num);
    }

    return $map[$n];
}
```