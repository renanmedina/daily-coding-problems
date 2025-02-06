```php
class SumRange {
    private $preSum;

    public function __construct($nums) {
        $this->preSum = array_fill(0, count($nums) + 1, 0);
        foreach ($nums as $index => $num) {
            $this->preSum[$index + 1] = $this->preSum[$index] + $num;
        }
    }

    public function sum($i, $j) {
        return $this->preSum[$j + 1] - $this->preSum[$i];
    }
}
```