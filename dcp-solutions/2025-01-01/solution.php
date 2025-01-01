```php
class Solution {
    public function reverseWords($s) {
        $words = explode(' ', $s);
        $reversed_words = array_reverse($words);
        $result = implode(' ', $reversed_words);
        return $result;
    }
}
```

Note that this PHP solution uses the `array_reverse` function to reverse the order of the words and then uses `implode` to join them back together into a single string.