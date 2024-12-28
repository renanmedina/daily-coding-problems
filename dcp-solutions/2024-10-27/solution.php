```php
class TreeNode {
    public $val = null;
    public $left = null;
    public $right = null;

    function __construct($x) {
        $this->val = $x;
    }
}

function build_tree($preorder, $inorder) {
    if (empty($preorder)) return null;
    $root = new TreeNode($preorder[0]);
    $i = array_search($preorder[0], $inorder);
    $root->left = build_tree(array_slice($preorder, 1, $i - 0 + 1), array_slice($inorder, 0, $i));
    $root->right = build_tree(array_slice($preorder, $i + 1), array_slice($inorder, $i + 1));
    return $root;
}
```