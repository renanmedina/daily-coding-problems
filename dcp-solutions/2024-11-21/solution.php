```php
<?php

function largestPathValue($graph, $edges) {
    if (empty($edges)) {
        return 0;
    }

    $n = strlen($graph);
    $adjList = array_fill(0, $n, []);
    foreach ($edges as list($u, $v)) {
        $adjList[$u][] = $v;
    }

    function dfs($node, &$adjList, &$graphValue) {
        if (isset($graphValue[$node])) {
            return $graphValue[$node];
        }
        if (empty($adjList[$node])) {
            return 0;
        }

        $maxCount = 0;
        foreach ($adjList[$node] as $nextNode) {
            $count = dfs($nextNode, $adjList, $graphValue);
            if (is_infinite($count)) {
                return is_infinite($count) ? INF : -1;
            }
            $maxCount = max($maxCount, $count);
        }

        $graphValue[$node] = $maxCount + 1;
        return $maxCount + 1;
    }

    function is_infinite($num) {
        return $num == INF || $num == -INF;
    }

    $graphValue = [];
    foreach ($adjList as list($k, $v)) {
        dfs($k, $adjList, $graphValue);
    }
    if (empty($graphValue)) {
        return 0;
    }

    $maxVal = max($graphValue);

    if ($maxVal == INF) {
        return null;
    }

    return $maxVal;
}
```