```php
function shortestSubstring($s, $ chars) {
    if (empty($chars)) {
        return "";
    }

    $charCount = array_count_values(str_split($chars));
    $left = 0;
    $minLen = INF;
    $minStr = "";

    $charSet = [];

    foreach ($charCount as $char => $count) {
        $charSet[$char] = 0;
    }

    for ($right = 0; $right < strlen($s); $right++) {
        if (isset($charSet[$s[$right]])) {
            $charSet[$s[$right]]++;
            if ($charSet[$s[$right]] == $charCount[$s[$right]]) {
                unset($charSet[$s[$right]]);
            }
        }

        while (!empty($charSet) && count($charSet) == count($charCount)) {
            if ($right - $left + 1 < $minLen) {
                $minLen = $right - $left + 1;
                $minStr = substr($s, $left, $minLen);
            }

            if (isset($charSet[$s[$left]])) {
                $charSet[$s[$left]]--;
                if ($charSet[$s[$left]] == 0) {
                    unset($charSet[$s[$left]]);
                }
            }

            $left++;
        }
    }

    return $minStr ? $minStr : null;
}
```