```javascript
class BitArray {
    constructor(size) {
        this.size = size;
        this.array = new Uint8Array(Math.ceil(this.size / 8));
    }

    init() {
        this.reset();
    }

    reset() {
        for (let i = 0; i < this.size; i++) {
            let index = Math.floor(i / 8);
            let bitIndex = i % 8;
            if ((this.array[index] & (1 << bitIndex)) !== 0) {
                this.array[index] |= (1 << bitIndex);
            } else {
                this.array[index] &= ~(1 << bitIndex);
            }
        }
    }

    set(index, val) {
        let index64 = index * 8;
        if (val === 0) {
            let index32 = Math.floor(index64 / 8);
            let index8 = index64 % 8;
            this.array[index32] &= ~(1 << index8);
        } else {
            let index32 = Math.floor(index64 / 8);
            let index8 = index64 % 8;
            this.array[index32] |= (1 << index8);
        }
    }

    get(index) {
        return ((this.array[Math.floor(index / 8)] & (1 << (index % 8))) !== 0 ? 1 : 0);
    }
}
```