```php
<?php

class JobScheduler {
    private $f;
    private $n;

    public function __construct($f, $n) {
        $this->f = $f;
        $this->n = $n;
    }

    public function schedule() {
        $thread = new class extends Thread {
            public function run() {
                sleep($this->f);
                call_user_func($this->f);
            }
        };

        $thread->start();
        $thread->join();

        return true;
    }
}

?>
```