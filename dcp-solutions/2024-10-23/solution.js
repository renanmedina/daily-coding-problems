```javascript
function countInversions(arr) {
    let n = arr.length;
    let temp = new Array(n).fill(0);
    let inversions = 0;

    function merge(i, j) {
        if (i >= j) return;
        let mid = Math.floor((i + j) / 2), k = i, m = mid + 1;
        while (k <= mid && m <= j) {
            if (arr[k] <= arr[m]) {
                temp[k++] = arr[k];
            } else {
                inversions += mid - k + 1;
                temp[m++] = arr[m];
            }
        }
        for (; k <= mid; k++) {
            temp[k] = arr[k];
        }
        for (; m <= j; m++) {
            temp[m] = arr[m];
        }
        for (i = 0, k = 1; k <= n; k++, i++) {
            arr[i] = temp[i + k - 1];
        }
    }

    merge(0, n - 1);
    return inversions;
}
```