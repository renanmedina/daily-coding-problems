```php
function countUnivalSubtrees($root) {
    $count = 0;
    function isUnival($node, $val) {
        if (!$node) return true;
        if ($node->val != $val) return false;
        return isUnival($node->left, $val) && isUnival($node->right, $val);
    }

    function dfs($node) use (&$count) {
        if (!$node) return;
        $count += (isUnival($node, $node->val) ? 1 : 0);
        dfs($node->left);
        dfs($node->right);
    }
    dfs($root);
    return $count;
}
```