```php
class Stack {
    private $list;
    private $size;
    private $stack_count;

    public function __construct() {
        $this->list = [];
        $this->size = 0;
        $this->stack_count = 0;
    }

    public function push($item, $stack_number) {
        if ($stack_number >= $this->stack_count) {
            $this->stack_count++;
            array_splice($this->list, 0, $this->stack_count);
        }
        array_push($this->list[$stack_number], $item);
        $this->size++;
    }

    public function pop($stack_number) {
        if ($stack_number >= 0 && $stack_number < $this->stack_count) {
            $item = array_pop($this->list[$stack_number]);
            $this->size--;
            return $item;
        } else {
            throw new Exception("Stack index out of range");
        }
    }
}
```