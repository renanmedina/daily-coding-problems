```javascript
class Stack {
    constructor() {
        this.stack = [];
    }

    push(val) {
        if (val > 0) {
            this.stack.push(val);
        } else {
            throw new Error("Invalid input. Value must be positive.");
        }
    }

    pop() {
        if (!this.isEmpty()) {
            return this.popFromStack();
        } else {
            throw new Error("Stack is empty");
        }
    }

    max() {
        if (!this.isEmpty()) {
            return Math.max(...this.stack);
        } else {
            throw new Error("Stack is empty");
        }
    }

    isEmpty() {
        return this.stack.length === 0;
    }

    popFromStack() {
        const val = this.stack[this.stack.length - 1];
        this.stack.pop();
        return val;
    }
}
```