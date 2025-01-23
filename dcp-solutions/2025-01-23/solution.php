```php
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

function minPathSum($root) {
    if (!$root) return 0;

    if (!$root->left && !$root->right) {
        return $root->val;
    }

    $min_sum = PHP_INT_MAX;
    if ($root->left) {
        $sum = $this->minPathSum($root->left);
        $sum += $root->val;
        $min_sum = min($min_sum, $sum);
    }
    if ($root->right) {
        $sum = $this->minPathSum($root->right);
        $sum += $root->val;
        $min_sum = min($min_sum, $sum);
    }

    return $min_sum;
}
```