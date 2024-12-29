```php
<?php
class TreeNode {
    public $val = 0;
    public $left = null;
    public $right = null;

    function __construct($val = 0, $left = null, $right = null) {
        $this->val = $val;
        $this->left = $left;
        $this->right = $right;
    }
}

function pathToLeaf($root) {
    $result = [];
    dfs($root, [], $result);
    return $result;
}

function dfs($node, $path, &$result) {
    if (!$node) return;

    array_push($path, $node->val);

    if (!$node->left && !$node->right) {
        $result[] = $path;
        return;
    }

    dfs($node->left, $path, $result);
    dfs($node->right, $path, $result);
}
?>
```