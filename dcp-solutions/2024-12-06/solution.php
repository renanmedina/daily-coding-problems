```php
<?php
class Solution {
    function validate($rules) {
        $map = ["N" => [0, 1], "S" => [0, -1], "E" => [1, 0], "W" => [-1, 0]];
        $dir = array_flip(["N", "NE", "E", "SE", "S", "SW", "W", "NW"]);
        
        foreach ($rules as $rule) {
            list($A, $r, $B) = explode(" ", $rule);
            if (!isset($map[$r][0])) return false;
            if (in_array($r, ["NE", "SE"], $dir)) {
                if ((($map[$r][0] - $map[$r][1]) * ($map[$A][0] + $map[$B][0])) >= 0) return false;
            } elseif (in_array($r, ["NW", "SW"], $dir)) {
                if (($map[$r][0] - $map[$r][1]) * ($map[$A][0] + $map[$B][0]) < 0) return false;
            }
        }
        
        return true;
    }
}
?>
```