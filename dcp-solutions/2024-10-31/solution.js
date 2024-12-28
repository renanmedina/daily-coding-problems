```javascript
class LRUCache {
    constructor(capacity) {
        this.capacity = capacity;
        this.cache = new Map();
        this.orderMap = new Map();
    }

    set(key, value) {
        if (this.cache.has(key)) {
            this.removeFromOrderMap(key);
        } else if (this.cache.size === this.capacity) {
            const lruKey = getLruKey(this.cache, this.orderMap);
            this.cache.delete(lruKey);
        }
        this.cache.set(key, value);
        this.addToOrderMap(key);
    }

    get(key) {
        if (!this.cache.has(key)) return null;
        this.removeFromOrderMap(key);
        this.addToOrderMap(key);
        return this.cache.get(key);
    }
}

function getLruKey(cache, orderMap) {
    let lruKey = null;
    for (let [key, value] of cache.entries()) {
        if (!orderMap.has(key)) {
            lruKey = key;
            break;
        }
    }
    return lruKey;
}

function addToOrderMap(key) {
    this.orderMap.set(key, this.cache.size - 1);
}

function removeFromOrderMap(key) {
    const index = this.orderMap.get(key);
    if (index === undefined) return;
    this.orderMap.delete(key);
    const nextKey = [...this.orderMap.keys()][index + 1];
    if (nextKey !== undefined) {
        this.orderMap.set(nextKey, index);
    }
}
```