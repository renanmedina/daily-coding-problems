```php
class Solution {
    public $n;
    public $digits;

    function nextPermutation($nums) {
        $this->n = count($nums);
        $this->digits = $nums;
        
        if (!this->isIncreasing()) {
            $this->reverse();
        }

        for ($i = $this->n - 2; $i >= 0; --$i) {
            if ($this->digits[$i] < $this->digits[$i + 1]) {
                break;
            }
        }

        if ($i == -1) {
            return array_reverse($nums);
        }

        for ($j = $this->n - 1; $j > $i; --$j) {
            if ($this->digits[$i] < $this->digits[$j]) {
                break;
            }
        }

        $temp = $this->digits[$i];
        $this->digits[$i] = $this->digits[$j];
        $this->digits[$j] = $temp;

        $this->reverse($i + 1);
    }

    function isIncreasing() {
        for ($i = 0; $i < $this->n - 1; ++$i) {
            if ($this->digits[$i] > $this->digits[$i+1]) return false;
        }
        return true;
    }

    function reverse($index) {
        $left = $index;
        $right = $this->n - 1;
        
        while ($left < $right) {
            $temp = $this->digits[$left];
            $this->digits[$left] = $this->digits[$right];
            $this->digits[$right] = $temp;
            ++$left;
            --$right;
        }
    }
}
```