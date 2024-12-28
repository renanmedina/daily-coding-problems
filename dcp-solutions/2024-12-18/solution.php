```php
function longestConsecutive($nums) {
    $num_set = array_flip($nums);
    $max_length = 0;

    foreach ($num_set as $num => $value) {
        if (!isset($num_set[$num - 1])) {
            $current_num = $num;
            $current_length = 1;

            while (isset($num_set[$current_num + 1])) {
                $current_num += 1;
                $current_length += 1;
            }

            $max_length = max($max_length, $current_length);
        }
    }

    return $max_length;
}
```