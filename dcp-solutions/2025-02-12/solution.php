```php
function majorityElement($lst) {
    $count = array();
    foreach ($lst as $num) {
        if (!isset($count[$num])) {
            $count[$num] = 0;
        }
        $count[$num]++;
    }

    foreach ($count as $num => $occurs) {
        if ($occurs > floor(count($lst) / 2)) {
            return $num;
        }
    }
}
```