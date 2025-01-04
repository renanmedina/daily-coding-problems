```javascript
class Node {
    constructor(value) {
        this.value = value;
        this.children = [];
    }
}

function generate() {
    let head = new Node(1);
    function insert(x, value) {
        if (value > x.value) {
            if (x.children.length === 0) {
                x.children.push(new Node(value));
            } else {
                while (x.children[x.children.length - 1].value < value) {
                    x = x.children[x.children.length - 1];
                }
                let lastChild = x.children.pop();
                insert(lastChild, value);
                if (lastChild.children.length > 0) {
                    x.children.push(lastChild);
                }
            }
        }
    }

    function traverse(head) {
        const stack = [head];
        while (stack.length) {
            head = stack.pop();
            console.log(head.value);
            for (let child of head.children) {
                stack.push(child);
            }
        }
    }

    return { head, insert, traverse };
}

const { head, insert, traverse } = generate();
insert(head, 3);
```