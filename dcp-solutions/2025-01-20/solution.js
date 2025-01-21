### JavaScript Solution
```markdown
class HitCounter {
    constructor() {
        this.cache = {};
    }

    record(timestamp) {
        if (!(timestamp in this.cache)) {
            this.cache[timestamp] = 1;
        } else {
            this.cache[timestamp]++;
        }
    }

    total() {
        return Object.values(this.cache).reduce((a, b) => a + b, 0);
    }

    range(lower, upper) {
        let count = 0;

        for (let ts in this.cache) {
            if (ts >= lower && ts <= upper) {
                count += this.cache[ts];
            } else if (ts > upper) break;
        }

        return count;
    }
}
```