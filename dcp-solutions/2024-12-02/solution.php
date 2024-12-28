```php
class TreeNode {
    public $val = null;
    public $left = null;
    public $right = null;

    function __construct($val = 0, $left = null, $right = null) {
        $this->val = $val;
        $this->left = $left;
        $this->right = $right;
    }
}

function invertTree($root) {
    if ($root == null) {
        return null;
    }

    $temp = $root->left;
    $root->left = $root->right;
    $root->right = $temp;

    invertTree($root->left);
    invertTree($root->right);

    return $root;
}
```