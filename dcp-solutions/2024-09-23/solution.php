```php
<?php

function estimate_pi($num_samples) {
    $x_coords = array();
    $y_coords = array();

    for ($i = 0; $i < $num_samples; $i++) {
        $x_coords[] = rand(-1, 1);
        $y_coords[] = rand(-1, 1);
    }

    $inside_circle = 0;

    foreach (array_map(null, $x_coords, $y_coords) as $point) {
        list($x, $y) = $point;
        if ($x * $x + $y * $y <= 1) {
            $inside_circle++;
        }
    }

    return 4 * $inside_circle / $num_samples;
}

$num_samples = 1000000; // adjust this value for a more accurate result
$pi_estimate = estimate_pi($num_samples);

printf("%.3f", $pi_estimate);

?>
```