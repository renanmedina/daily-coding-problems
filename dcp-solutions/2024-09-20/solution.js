```javascript
class TrieNode {
    constructor() {
        this.children = {};
        this.isWord = false;
    }
}

class Autocomplete {
    constructor(dict) {
        this.root = new TrieNode();
        for (let word of dict) {
            let node = this.root;
            for (let char of word) {
                if (!node.children[char]) {
                    node.children[char] = new TrieNode();
                }
                node = node.children[char];
            }
            node.isWord = true;
        }
    }

    autocomplete(s) {
        let result = [];
        function dfs(node, prefix) {
            for (let char in node.children) {
                if (prefix + char) {
                    dfs(node.children[char], prefix + char);
                } else if (!node.children[char].isWord) {
                    continue;
                }
                result.push(prefix + char);
            }
        }
        dfs(this.root, s);
        return result;
    }
}
```