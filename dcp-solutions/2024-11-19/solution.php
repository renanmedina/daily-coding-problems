```php
<?php

class Solution {
    public function nthPerfectNumber($n) {
        $i = 1;
        $cnt = 0;
        while ($cnt < $n) {
            $num = (int)sqrt(10 * $i - 9);
            if ((int)sqrt((10 * $i - 9)) == (10 * $i - 9)) {
                $sum = array_sum(str_split($i));
                if ($sum == 10) {
                    $cnt++;
                    $result[] = $i;
                }
            } else {
                $i++;
            }
        }
        return end($result);
    }
}

?>
```