```php
function rotate_string($A, $B) {
    if (strlen($A) != strlen($B)) {
        return false;
    }
    
    if (strlen($A) == 1) {
        return $A == $B;
    }
    
    for ($i = 0; $i < strlen($A); $i++) {
        $temp = substr($A, $i);
        $A = substr($A, 0, $i) . substr($B, 0, strlen($A) - $i) . substr($A, strlen($A) - (strlen($A) - $i));
        
        if ($A == $B) {
            return true;
        }
    }
    
    return false;
}
```