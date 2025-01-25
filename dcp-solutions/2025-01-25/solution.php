```php
class BitArray {
    private $size;
    private $array;

    public function __construct($size) {
        $this->size = $size;
        $this->array = array_fill(0, $size + 1, 0);
    }

    public function set($i, $val) {
        if ($i < 0 || $i >= $this->size) {
            throw new Exception("Index out of range");
        }
        if (!in_array($val, [0, 1])) {
            throw new Exception("Invalid value. Must be either 0 or 1");
        }
        $i++;
        while ($i <= $this->size) {
            $this->array[$i] = $val;
            $i += $i & -$i;
        }
    }

    public function get($i) {
        if ($i < 0 || $i >= $this->size) {
            throw new Exception("Index out of range");
        }
        $i++;
        $result = 0;
        while ($i > 0) {
            $result += $this->array[$i];
            $i -= $i & -$i;
        }
        return $result;
    }
}
```