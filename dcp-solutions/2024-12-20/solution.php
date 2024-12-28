```php
<?php

function find_two_sum($n) {
    $sieve = array_fill(0, 3000, true);
    $sieve[0] = $sieve[1] = false;

    for ($i = 2; $i * $i <= 3000; $i++) {
        if ($sieve[$i]) {
            for ($j = $i * $i; $j < count($sieve); $j += $i) {
                $sieve[$j] = false;
            }
        }
    }

    $primes = array();
    foreach ($sieve as $num => $val) {
        if ($val) {
            $primes[] = $num;
        }
    }

    for ($i = 0; $i < count($primes); $i++) {
        for ($j = $i + 1; $j < count($primes); $j++) {
            if ($primes[$i] + $primes[$j] == $n) return array($primes[$i], $primes[$j]);
        }
    }

    //If no solution is found
    return false;
}

?>
```