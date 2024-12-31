```php
<?php

class Node {
    public $val;
    public $left;
    public $right;
    public $parent;

    function __construct($key) {
        $this->val = $key;
        $this->left = null;
        $this->right = null;
        $this->parent = null;
    }
}

function lowest_common_ancestor($root, $p, $q) {
    while ($p != $root && $p->parent != $root) {
        $p = $p->parent;
    }

    while ($q != $root && $q->parent != $root) {
        $q = $q->parent;
    }

    while ($q != $p) {
        $q = $q->parent;
        $p = $p->parent;
    }
    return $q;
}

?>
```