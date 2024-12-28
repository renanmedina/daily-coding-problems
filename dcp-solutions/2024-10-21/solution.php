```php
<?php
function subsetSum($S, $k) {
    $dp = array_fill(0, count($S) + 1, false);
    $dp[0] = true;

    foreach ($S as $num) {
        for ($i = count($S); $i >= $num; $i--) {
            $dp[$i] = $dp[$i] || $dp[$i - $num];
        }
    }

    if ($dp[count($S)] == false) {
        return null;
    } else {
        $result = array();
        $i = count($S);
        while ($i > 0 && $dp[$i]) {
            if ($dp[$i] != $dp[$i - 1]) {
                $result[] = $S[$i-1];
            }
            $i--;
        }
        return array_reverse($result);
    }
}
?>
```