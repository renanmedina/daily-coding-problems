```php
<?php
function minSteps($points) {
    $x = $points[0][0];
    $y = $points[0][1];
    $dx = 0;
    $dy = 0;

    foreach ($points as $point) {
        list($px, $py) = $point;
        if ($px != $x || $py != $y) {
            $dx = $px - $x;
            $dy = $py - $y;
            break;
        }
    }

    $steps = abs($dx) + abs($dy);
    foreach ($points as $point) {
        list($px, $py) = $point;
        if ($dx != 0 && $px < $x) {
            $steps += min(max(0, $x - $px), abs($dx));
            $x = $px;
        } elseif ($dy != 0 && $py > $y) {
            $steps += min(max(0, $py - $y), abs($dy));
            $y = $py;
        }
    }

    return $steps;
}
```