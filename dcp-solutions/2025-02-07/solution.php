```php
<?php

class Solution {
    function findNearestKPoints($points, $center, $k) {
        $queue = new SplPriorityQueue();
        $distanceMap = array();

        foreach ($points as $point) {
            $priority = $this->calculateDistance($point, $center);
            $distanceMap[$point] = $priority;
            $queue->insert($point, -$priority);
        }

        $nearestKPoints = [];

        for ($i = 0; $i < $k; $i++) {
            $nearestPoint = $queue->extract();
            $nearestKPoints[] = $nearestPoint;
        }

        return $nearestKPoints;
    }

    function calculateDistance($point1, $point2) {
        list($x1, $y1) = $point1;
        list($x2, $y2) = $point2;

        return sqrt(pow($x1 - $x2, 2) + pow($y1 - $y2, 2));
    }
}

?>
```