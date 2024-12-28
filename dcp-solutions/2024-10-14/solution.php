```php
function sort_rgb($arr) {
    $n = count($arr);
    
    // Place all the 0's at the beginning
    $r = 0;
    $g = 0;
    $b = $n - 1;

    while ($g <= $b) {
        if ($arr[$g] == 'R') {
            swap($arr, $g++, $r++);
        } elseif ($arr[$g] == 'G') {
            $g++;
        } else {
            swap($arr, $g, $b--);
        }
    }

    return $arr;
}

function swap(&$arr, $i, $j) {
    $temp = $arr[$i];
    $arr[$i] = $arr[$j];
    $arr[$j] = $temp;
}
```