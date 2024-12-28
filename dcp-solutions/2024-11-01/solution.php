```php
<?php
class Queue {
    private $stack1 = array();
    private $stack2 = array();

    public function enqueue($x) {
        array_push($this->stack1, $x);
    }

    public function dequeue() {
        if (empty($this->stack2)) {
            while (!empty($this->stack1)) {
                array_push($this->stack2, array_pop($this->stack1));
            }
        }
        return array_pop($this->stack2);
    }

    public function empty() {
        return empty($this->stack1) && empty($this->stack2);
    }
}
```