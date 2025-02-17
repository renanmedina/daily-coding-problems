```php
class Solution {
    function longestPath($edges, $n) {
        $adj = array_fill(0, $n, []);
        foreach ($edges as $edge) {
            list($u, $v) = $edge;
            $adj[$u][] = $v;
            $adj[$v][] = $u;
        }
        
        $dp = array_fill(0, $n, [-INF, 0]);
        function dfs($node, &$adj, &$dp) {
            foreach ($adj[$node] as $child) {
                if ($dp[$child][0] < 0) {
                    dfs($child, $adj, $dp);
                }
                $dp[$node][0] = max($dp[$node][0], $dp[$child][0] + (int)$edges[explode(',', $node),1]);
                $dp[$node][1] = max($dp[$node][1], $dp[$child][1] + (int)$edges[explode(',', $node),1]);
            }
        }
        
        dfs(0, $adj, $dp);
        return max(array_column($dp, 0));
    }
}
```