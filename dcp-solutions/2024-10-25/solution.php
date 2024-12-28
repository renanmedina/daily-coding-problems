```php
function longest_palindromic_substring($s) {
    $N = strlen($s);
    
    // Create a 2D array to store whether each substring is palindromic or not.
    $dp = array_fill(0, $N + 1, array_fill(0, $N + 1, false));
    
    // Initialize the answer string and its length
    $ans = "";
    $max_length = 0;
    
    // All substrings of length 1 are palindromes.
    for ($i = 0; $i < $N; $i++) {
        $dp[$i][$i] = true;
        if ($max_length < 1) {
            $ans = $s[$i];
            $max_length = 1;
        }
    }

    // Check for substring of length 2.
    for ($i = 0; $i < $N - 1; $i++) {
        if ($s[$i] == $s[$i + 1]) {
            $dp[$i][$i + 1] = true;
            if ($max_length < 2) {
                $ans = $s[$i] . $s[$i+1];
                $max_length = 2;
            }
        }
    }

    // Check for lengths greater than 2.
    for ($len = 3; $len <= $N; $len++) {
        for ($start = 0; $start < $N - $len + 1; $start++) {
            $end = $start + $len - 1;
            
            // A substring is palindromic if its first and last characters are same
            // and the substring in between is also a palindrome.
            if ($s[$start] == $s[$end]) {
                if ($dp[$start + 1][$end - 1]) {
                    $dp[$start][$end] = true;
                    
                    // If this is the longest so far, update answer
                    if ($max_length < $len) {
                        $ans = substr($s, $start, $len);
                        $max_length = $len;
                    }
                }
            }
        }
    }

    return $ans;
}
```