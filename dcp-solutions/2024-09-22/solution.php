```php
function lengthOfLongestSubstringKDistinct($s, $k) {
    if (empty($s)) return 0;
    
    $start = 0;
    $maxLen = 0;
    $charMap = array();
    
    for ($end = 0; $end < strlen($s); $end++) {
        $rightChar = $s[$end];
        
        if (!isset($charMap[$rightChar]) || !++$charMap[$rightChar] == 1) {
            continue;
        }
        
        while (count($charMap) > $k) {
            $leftChar = $s[$start];
            --$charMap[$leftChar];
            if ($charMap[$leftChar] == 0) unset($charMap[$leftChar]);
            $start++;
        }
        
        $maxLen = max($maxLen, $end - $start + 1);
    }
    
    return $maxLen;
}
```