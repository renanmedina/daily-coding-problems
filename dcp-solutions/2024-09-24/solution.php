### Solution
```php
class RandomisedSet {
    private $val;
    private $index;
    private $map;

    public function __construct() {
        $this->val = [];
        $this->index = range(0, 0);
        $this->map = array_flip($this->index);
    }

    public function insert($val) {
        if (!in_array($val, $this->val)) {
            $index = array_search(null, $this->index);
            unset($this->index[$index]);
            $this->index[] = $val;
            $this->map[$val] = count($this->index) - 1;
            $this->val[] = $val;
            return true;
        }
        return false;
    }

    public function remove($val) {
        if (in_array($val, $this->val)) {
            $index = $this->map[$val];
            unset($this->index[$index]);
            $temp = array_pop($this->val);
            $this->index[] = $temp;
            $this->map[$temp] = count($this->index) - 1;
            return true;
        }
        return false;
    }

    public function getRandom() {
        return $this->val[array_rand($this->val)];
    }
}
```