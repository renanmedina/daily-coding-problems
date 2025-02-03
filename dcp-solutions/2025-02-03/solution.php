```php
class Solution {
    function pruneTree($root) {
        if (!$root) return null;
        
        $root->left = $this->pruneTree($root->left);
        $root->right = $this->pruneTree($root->right);

        if ($root->val == 0 && !$root->left && !$root->right) {
            return null;
        }
        
        return $root;
    }
}
```