```php
<?php

class Stack {
    private $heap;

    public function __construct() {
        $this->heap = [];
    }

    public function push($item) {
        $this->heap[] = -$item;
        heapifyUp(count($this->heap) - 1);
    }

    public function pop() {
        if (empty($this->heap)) {
            throw new Exception("Heap is empty");
        }
        $value = -$this->heap[0];
        $this->heap[0] = $this->heap[count($this->heap) - 1];
        array_pop($this->heap);
        heapifyDown(0);
        return $value;
    }

    private function heapifyUp($index) {
        $parentIndex = floor(($index - 1) / 2);
        if ($index > 0 && $this->heap[$index] > $this->heap[$parentIndex]) {
            swap($index, $parentIndex);
            heapifyUp($parentIndex);
        }
    }

    private function heapifyDown($index) {
        $leftChildIndex = 2 * $index + 1;
        $rightChildIndex = 2 * $index + 2;
        $largestIndex = $index;

        if ($leftChildIndex < count($this->heap) && $this->heap[$leftChildIndex] > $this->heap[$largestIndex]) {
            $largestIndex = $leftChildIndex;
        }

        if ($rightChildIndex < count($this->heap) && $this->heap[$rightChildIndex] > $this->heap[$largestIndex]) {
            $largestIndex = $rightChildIndex;
        }

        if ($largestIndex !== $index) {
            swap($index, $largestIndex);
            heapifyDown($largestIndex);
        }
    }

    private function swap($i, $j) {
        $temp = $this->heap[$i];
        $this->heap[$i] = $this->heap[$j];
        $this->heap[$j] = $temp;
    }
}

?>
```