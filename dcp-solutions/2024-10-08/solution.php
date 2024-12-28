```php
<?php
class Solution {
    function runLengthEncoding($str) {
        $result = '';
        if (empty($str)) return $result;
        $count = 1;
        $prevChar = substr($str, 0, 1);
        
        for ($i = 1; $i < strlen($str); $i++) {
            if ($str[$i] == $prevChar) {
                $count++;
            } else {
                $result .= (string)$count . $prevChar;
                $prevChar = $str[$i];
                $count = 1;
            }
        }
        
        // append the last character
        $result .= (string)$count . $prevChar;
        return $result;
    }

    function runLengthDecoding($encodedStr) {
        $result = '';
        $countEnd = false;
        for ($i = 0; $i < strlen($encodedStr); $i++) {
            if ($encodedStr[$i] == 'D') {
                $countEnd = true;
            } elseif ($encodedStr[$i] != '') {
                if ($countEnd) {
                    array_push($result, str_repeat($encodedStr[$i - 1], intval(substr($encodedStr, $i - 2, 2))) . '');
                    $i += 2; // skip two characters
                } else {
                    array_push($result, $encodedStr[$i]);
                }
            }
        }
        return implode('', $result);
    }
}
?>
```