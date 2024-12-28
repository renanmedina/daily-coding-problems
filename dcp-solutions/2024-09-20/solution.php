```php
class AutocompleteSystem {
    private $dictionary;
    private $tire;

    public function __construct($words) {
        $this->dictionary = array();
        $this->tire = new Tire($words);
    }

    public function suggestedQueries($s) {
        return $this->tire->query($s);
    }
}

class TrieNode {
    public $children;
    public $end;

    public function __construct() {
        $this->children = array();
        $this->end = false;
    }
}

class Tire {
    private $root;
    private $dictionary;

    public function __construct($words) {
        $this->root = new TrieNode();
        foreach ($words as $word) {
            $node = $this->root;
            for ($i = 0; $i < strlen($word); $i++) {
                if (!isset($node->children[$word[$i]])) {
                    $node->children[$word[$i]] = new TrieNode();
                }
                $node = $node->children[$word[$i]];
            }
            $node->end = true;
        }
    }

    public function query($s) {
        $node = $this->root;
        for ($i = 0; $i < strlen($s); $i++) {
            if (!isset($node->children[$s[$i]])) return array();
            $node = $node->children[$s[$i]];
        }
        return $this->_query($node, $s);
    }

    private function _query(TrieNode $node, $prefix) {
        $result = array($prefix . ($node->end ? '' : ''));
        foreach ($node->children as $char => $child) {
            $result = array_merge($result, $this->_query($child, $prefix . $char));
        }
        return $result;
    }
}
```