```php
class LRUCache {
    private $capacity;
    private $cache;
    private $keyMap;

    public function __construct($capacity) {
        $this->capacity = $capacity;
        $this->cache = [];
        $this->keyMap = [];
    }

    public function set($key, $value) {
        if (isset($this->keyMap[$key])) {
            $this->removeKey($key);
        } elseif (count($this->cache) >= $this->capacity) {
            $this->removeLeastRecentlyUsed();
        }
        $this->addKey($key, $value);
    }

    public function get($key) {
        if (!isset($this->keyMap[$key])) {
            return null;
        }
        $this->removeKey($key);
        $this->addKey($key, $this->cache[$key]);
        return $this->cache[$key];
    }

    private function removeLeastRecentlyUsed() {
        unset($this->keyMap[array_search(min(array_keys($this->keyMap)), array_keys($this->keyMap))]);
        array_pop($this->cache);
    }

    private function addKey($key, $value) {
        if (!isset($this->keyMap[$key])) {
            $this->keyMap[$key] = $value;
        }
        $this->cache[$key] = $value;
    }

    private function removeKey($key) {
        unset($this->cache[$key]);
        unset($this->keyMap[$key]);
    }
}
```