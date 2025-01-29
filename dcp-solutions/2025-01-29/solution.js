```javascript
class Stack {
    constructor() {
        this.list = [];
    }

    pop(stackNumber) {
        let index = (stackNumber - 1) * 2;
        let size = Math.floor(this.list.length / 2);

        if (size === 0) return null;

        if (index % 2 === 0) {
            let half = this.list.slice(0, size);
            let otherHalf = this.list.slice(size);
            return [...half.reverse(), ...otherHalf];
        } else {
            let bottomStack = this.list.slice(0, size - Math.floor(index / 2));
            let topStack = this.list.slice(Math.floor(index / 2) + size);
            return [...bottomStack, ...topStack.reverse()];
        }
    }

    push(item, stackNumber) {
        let index = (stackNumber - 1) * 2;
        let size = Math.floor(this.list.length / 2);

        if (size === 0) this.list.push(item);
        else {
            if (index % 2 === 0) {
                let half = [...this.list.slice(0, size), item];
                let otherHalf = this.list.slice(size);
                return [...half, ...otherHalf];
            } else {
                let bottomStack = [item, ...this.list.slice(0, size - Math.floor(index / 2))];
                let topStack = this.list.slice(Math.floor(index / 2) + size);
                return [...bottomStack, ...topStack.reverse()];
            }
        }
    }
}
```