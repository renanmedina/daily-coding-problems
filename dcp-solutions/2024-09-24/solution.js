```javascript
class RandomizedSet {
    constructor() {
        this.store = new Map();
    }

    add(val) {
        if (!this.store.has(val)) {
            this.store.set(val, [...this.store.size]);
            return true;
        }
        return false;
    }

    remove(val) {
        let idx = this.store.get(val);
        if (idx !== val) {
            let lastIdxVal = this.store.keys().next().value;
            [this.store.set(idx), this.store.set(lastIdxVal)] = [lastIdxVal, idx];
        }
        this.store.delete(val);
        return true;
    }

    getRandom() {
        return this.store.keys().next().value;
    }
}
```