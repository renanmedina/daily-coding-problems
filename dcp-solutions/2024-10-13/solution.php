```php
function make_palindrome($s) {
    $n = strlen($s);
    for ($i = 0; $i < $n; $i++) {
        $l = $i;
        $r = $n - 1 - $i;
        while ($l >= 0 && $r < $n && $s[$l] == $s[$r]) {
            $l--;
            $r++;
        }
        $diff = max(0, $i + 1) + (int)(($n - 1 - $i)) - 2 * ($r - $l);
        if ($diff < strlen($s) - $n || $diff == strlen($s) - $n && strcmp($s[$l + 1] . substr($s, $l) . substr(strrev(substr($s, 0, $l)), $i), $s) < 0) {
            return $s.substring(0,$i+1) . strrev(substr($s, $i)) . $s.substring($i+1);
        }
    }
    return $s;
}
```