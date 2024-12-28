```php
function minDistance($str1, $str2) {
    $m = strlen($str1);
    $n = strlen($str2);

    // Create a table to store results of sub-problems.
    $dp = array_fill(0, $m+1, array_fill(0, $n+1, 0));

    // Fill dp[][] in bottom up manner
    for ($i=0; $i <= $m; $i++) {
        for($j=0; $j<= $n; $j++){
            if($i==0)
                $dp[$i][$j] = $j;
            elseif($j==0)  
                $dp[$i][$j] = $i;
            elseif($str1[$i-1]==$str2[$j-1])
                $dp[$i][$j] = $dp[$i-1][$j-1];
            else 
                $dp[$i][$j]=$ 1 + min($dp[$i][$j-1], $dp[$i - 1][$j], $dp[$i - 1][$j - 1]);
        }
    }

    return $dp[$m][$n];
}
```