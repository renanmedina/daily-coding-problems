```php
class Solution {
    public $dx = array(0, 0, -1, 0, -1,-1,1,1);
    public $dy = array(0, 1, 0, 1, -1,-1,1,1);

    function minSteps($coordinates) {
        $n = count($coordinates);
        $q = new SplPriorityQueue();
        $q->insert(array($coordinates[0], 0), 0);
        $visited = array_fill(0,$n, false);
        $visited[0] = true;
        while (!$q->isEmpty()) {
            list($x, $step) = $q->extract();
            if ($x == $coordinates[$n - 1]) return $step;
            for($i=0;$i<8;$i++) {
                $nx = $x + $this->dx[$i];
                $ny = $x + $this->dy[$i]; 
                if(!in_array(array($nx, $ny),$coordinates) && !isset($visited[array_search(array($nx, $ny),$coordinates)])) {
                    $q->insert(array(array($nx, $ny),$step+1), ($step+1));
                    $visited[array_search(array($nx, $ny),$coordinates)] = true;
                }
            }   
        } 
    }
}
```