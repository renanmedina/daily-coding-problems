```php
<?php
function breakString($s, $k) {
    $words = explode(' ', trim($s));
    if (empty($words)) return null;

    $result = [];
    $currentLine = '';
    foreach ($words as $word) {
        if (strlen($currentLine) + strlen($word) + 1 > $k) {
            if (!empty($currentLine)) array_push($result, $currentLine);
            $currentLine = $word;
        } else {
            if ($currentLine) $currentLine .= ' ';
            $currentLine .= $word;
        }
    }
    if ($currentLine) array_push($result, $currentLine);

    // If the number of lines in result is more than 1 and each line has only one word then return null
    $lines = count($result);
    for ($i=0; $i<$lines ; $i++) {
        if (count($result[$i]) == 1) return null;
    }
    return $result;
}
```