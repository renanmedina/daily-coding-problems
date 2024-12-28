```php
class Node {
    public $val;
    public $left;
    public $right;

    function __construct($x) {
        $this->val = x;
        $this->left = null;
        $this->right = null;
    }
}

function maxBST($root, $max_size = 0) {
    if (!$root) return $max_size;

    $left_max = INF;
    $right_max = -INF;

    if ($root->left) {
        list($left_max, $_) = maxBST($root->left, $max_size);
    }

    if ($root->right) {
        list($_, $right_max) = maxBST($root->right, $max_size);
    }

    if ($left_max == INF && $right_max == -INF) return $max_size + 1;
    if ($left_max != INF && $right_max != INF && $root->val > $left_max && $root->val < $right_max) {
        return max($max_size, 1 + maxBST($root->left, $left_max) + maxBST($root->right, $right_max));
    }
    
    return $max_size;
}

```