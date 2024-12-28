```php
<?php

class Debouncer {
    private $func;
    private $delay;
    private $timerId;

    public function __construct($func, $delay) {
        $this->func = $func;
        $this->delay = $delay;
        $this->timerId = null;
    }

    public function debounced() {
        return function (...$args) use ($this) {
            if (isset($this->timerId)) {
                clearTimeout($this->timerId);
            }
            $this->timerId = setTimeout(function () use ($this, ...$args) {
                call_user_func_array($this->func, $args);
            }, $this->delay);
        };
    }
}
```