```php
class Node {
    public $left;
    public $right;

    function __construct($value) {
        $this->left = null;
        $this->right = null;
        $this->value = $value;
    }
}

class BinaryTreeGenerator {
    public $root;

    function generate() {
        $this->root = new Node(0);
        return $this->root;
    }

    function add($parent_value, $child_value) {
        $queue = array();
        $queue[] = $this->root;

        while (!empty($queue)) {
            $node = array_shift($queue);

            if ($node->value < $parent_value && empty($node->right)) {
                $node->right = new Node($parent_value);
                $queue[] = $node->right;
            } elseif ($node->value > $parent_value && empty($node->left)) {
                $node->left = new Node($parent_value);
                $queue[] = $node->left;
            }

            if (empty($node->left) && $node->value < $child_value && !empty($node->right)) {
                $node->right = new Node($child_value);
                return true;
            } elseif (empty($node->right) && $node->value > $child_value && !empty($node->left)) {
                $node->left = new Node($child_value);
                return true;
            }
        }

        return false;
    }
}
```