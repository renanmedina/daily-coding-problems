```javascript
function findAnagrams(W, S) {
    let charCount = {};
    let wLen = W.length;
    let sLen = S.length;

    if (wLen > sLen) return [];

    let anagramStarts = new Set();

    for (let i = 0; i < wLen; i++) {
        let wc = W[i];
        charCount[wc] = (charCount[wc] || 0) + 1;
    }

    for (let sI = 0; sI < sLen; sI++) {
        let sc = S[sI];

        if (wLen <= anagramStarts.size) {
            while (anagramStarts.size === wLen && Object.keys(charCount).every((c) => charCount[c] > 0)) {
                let sC = S[Array.from(anagramStarts)[anagramStarts.size - 1]];
                charCount[sC]--;
                if (charCount[sC] == 0) delete charCount[sC];
                anagramStarts.delete(Array.from(anagramStarts)[anagramStarts.size - 1]);
            }
        }

        charCount[sc]++;
        anagramStarts.add(sI);
    }

    return Array.from(anagramStarts);
}
```