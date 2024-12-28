```php
<?php
function can_reach_end($arr) {
    $maxReach = 0;
    foreach ($arr as $i => $hops) {
        if ($i > $maxReach) return false;
        $maxReach = max($maxReach, $i + $hops);
    }
    return true;
}
?>
```