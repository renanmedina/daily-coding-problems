```php
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public $val;
 *     public $left;
 *     public $right;
 *     function __construct($x) { $this->val = $x; $this->left = null; $this->right = null; }
 * }
 */
class Solution {
    function findTarget($root, $K) {
        $seen = array();
        return this->findPair($root, $K, $seen);
    }

    private function findPair($node, $sum, &$seen) {
        if (!$node) return null;
        $key = $node->val;
        $other = $sum - $key;

        if (in_array($other, $seen)) {
            return array($other, $key);
        }
        
        $leftResult = $this->findPair($node->left, $sum, $seen);
        if ($leftResult) return $leftResult;
        
        $rightResult = $this->findPair($node->right, $sum, $seen);
        if ($rightResult) return $rightResult;

        array_push($seen, $key);
        return null;
    }
}
```