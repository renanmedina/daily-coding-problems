```php
<?php
class TreeNode {
    public $val = 0;
    public $left = null;
    public $right = null;

    function __construct($val) {
        $this->val = $val;
    }
}

function isValidBST($root) {
    return helper($root, PHP_INT_MIN, PHP_INT_MAX);
}

function helper($node, $lower, $upper) {
    if (!$node) return true;

    if ($node->val <= $lower || $node->val >= $upper) return false;
    $left = helper($node->left, $lower, $node->val);
    $right = helper($node->right, $node->val, $upper);

    return $left && $right;
}
```