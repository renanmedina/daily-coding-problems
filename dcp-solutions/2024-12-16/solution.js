```javascript
class Map {
    constructor() {
        this.map = {};
        this.timeMap = {};
    }

    set(key, value, time) {
        if (!(key in this.map)) {
            this.map[key] = new MapItem(value);
        } else {
            const existingItem = this.map[key];
            existingItem.value = value;
            existingItem.lastUpdate = time;
        }
        
        if (!(time in this.timeMap)) {
            this.timeMap[time] = [key, value];
        } else {
            const itemsAtTime = this.timeMap[time];

            while (itemsAtTime.length && itemsAtTime[0].t < time) {
                itemsAtTime.shift();
            }
            itemsAtTime.push([key, value]);
        }

    }

    get(key, time) {
        if (!(key in this.map)) {
            return null;
        } else {
            const item = this.map[key];

            let lastUpdate = item.lastUpdate;
            while (lastUpdate > time && !(time in this.timeMap)) {
                for (const t in this.timeMap) {
                    lastUpdate = Math.max(lastUpdate, ...this.timeMap[t]);
                }
            }

            if (!(time in this.timeMap)) {
                return item.value;
            } else {
                const itemsAtTime = this.timeMap[time];
                let currentValue = itemsAtTime.reduce((acc, val) => acc + (val[1] || 0), 0);
                while (currentValue === Infinity && itemsAtTime.length > 0) {
                    currentValue -= itemsAtTime.shift()[1];
                }
                return currentValue;
            }

        }
    }
}

class MapItem {
    constructor(value) {
        this.value = value;
        this.lastUpdate = -Infinity;
    }
}
```