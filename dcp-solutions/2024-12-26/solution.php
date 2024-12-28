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

function printBinaryTreeLevelWise($root) {
    if (!$root) return;

    $queue = array(array($root, 0));
    while (!empty($queue)) {
        list($node, $level) = array_shift($queue);
        echo $node->val . " ";

        if ($level == 0 && $node->left) {
            array_push($queue, array($node->left, 1));
        }
        if ($level == 0 && $node->right) {
            array_push($queue, array($node->right, 1));
        }

        foreach (array($node->left, $node->right) as $child) {
            if ($child) {
                array_push($queue, array($child, $level + 1));
            }
        }
    }
}
```