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

function evalTree($root) {
    if (!$root) return 0;
    if (!($root->left || $root->right)) return (int)$root->val;

    $left_val = evalTree($root->left);
    $right_val = evalTree($root->right);

    switch ($root->val) {
        case '+':
            return $left_val + $right_val;
        case '-':
            return $left_val - $right_val;
        case '*':
            return $left_val * $right_val;
        case '/':
            return (int)($left_val / $right_val);
    }
}
```