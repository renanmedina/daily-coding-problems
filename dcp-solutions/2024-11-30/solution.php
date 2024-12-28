```php
function letterCombinations($digits, $mapping) {
    if (empty($digits)) {
        return array();
    }

    $result = array();
    $queue = array(array());
    foreach ($digits as $i => $digit) {
        $temp = array();
        foreach ($queue as $word) {
            foreach ($mapping[$digit] as $new_letter) {
                if ($i == count($digits) - 1) {
                    $result[] = $word . $new_letter;
                } else {
                    $temp[] = $word . $new_letter;
                }
            }
        }
        $queue = $temp;
    }

    return $result;
}
```