### PHP Solution
```php
<?php
function reverse_words_and_delimiters($s, $delimiters) {
    $parts = explode($delimiters, $s);
    $reversedParts = array_reverse($parts);

    foreach ($reversedParts as &$part) {
        $start = strpos($part, ':');
        if ($start !== false) {
            list($word, $delimiter) = explode(':', substr($part, $start + 1));
            $part = ':' . $delimiter . ' ' . $word;
        }
    }

    return implode('', $reversedParts);
}
```