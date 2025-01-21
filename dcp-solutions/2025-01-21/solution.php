```php
class TreeNode {
    public $val;
    public $left;
    public $right;
    public $parent;

    function __construct($val) {
        $this->val = $val;
        $this->left = null;
        $this->right = null;
        $this->parent = null;
    }
}

class Solution {
    function inorderSuccessor($root, $p) {
        if (!$p || !$root || $p == $root) return null;

        while ($p && $p->right && $p->right != $root) {
            $p = $p->right;
        }

        if ($p->right == $root) {
            $successor = $this->dfs($root, $p);
            return $successor ? $successor->val : null;
        } else {
            while ($p && $p->left != $root) {
                $p = $p->left;
            }
            return $this->dfs($root, $p);
        }
    }

    function dfs($node, $p) {
        if (!$node || $node == $p) return null;

        while ($node && $node->right && $node->right != $p) {
            $node = $node->right;
        }

        if ($node->right == $p) {
            return $this->dfs($node, $p);
        } else {
            while ($node && $node->left != $p) {
                $node = $node->left;
            }
            return $this->dfs($node, $p);
        }
    }
}
```