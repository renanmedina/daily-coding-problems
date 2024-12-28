```php
function findItinerary($flights, $start) {
    $graph = array();
    foreach ($flights as $flight) {
        list($from, $to) = $flight;
        if (!isset($graph[$from])) {
            $graph[$from] = array();
        }
        $graph[$from][] = $to;
    }

    $result = array();
    $queue = array(array($start));
    while ($queue) {
        $path = array_shift($queue);
        $lastCity = end($path);

        if (!isset($graph[$lastCity])) {
            continue;
        }
        foreach ($graph[$lastCity] as $nextCity) {
            $newPath = $path;
            $newPath[] = $nextCity;
            sort($newPath);
            if (empty(array_slice($result, 0, count($newPath)))) {
                array_splice($result, 0, count($result), $newPath);
            } elseif ($result[count($result) - 1] == $newPath) {
                continue;
            }
            $queue[] = $newPath;
        }
    }

    if (empty($result)) {
        return null;
    }
    return $result;
}
```