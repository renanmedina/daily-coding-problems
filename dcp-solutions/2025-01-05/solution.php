```php
<?php
class TreeNode {
    public $val;
    public $left;
    public $right;

    function __construct($x) {
        $this->val = $x;
        $this->left = null;
        $this->right = null;
    }
}

function minSumLevel($root) {
    if (!$root) return 0;
    
    $min_sum = PHP_INT_MAX;
    $queue = array(array(0, 0)); // node val and level

    while (!empty($queue)) {
        list($node_val, $level) = array_shift($queue);
        
        if ($level > $min_sum) continue;
        
        if (!$node_val) return $level;
        elseif ($min_sum_level($root->left) && $minSum > $node_val + $minSum_level($root->right)) {
            $min_sum = $node_val + minSum_level($root->left) + minSum_level($root->right);
        }
        
        if ($node_val->left || $node_val->right) array_push($queue, array(($node_val->val) + ($node_val->left ? $node_val->left->val : 0), $level+1));
    }

    return -1;
}
?>
```