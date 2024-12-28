```javascript
function findPrimeNumbers(n) {
    function isPrime(num) {
        if (num <= 1) return false;
        if (num == 2) return true;
        if (num % 2 == 0) return false;

        const sqrtNum = Math.sqrt(num);
        for (let i = 3; i <= sqrtNum; i += 2) {
            if (num % i == 0) return false;
        }

        return true;
    }

    let left = 2, right = n / 2;
    while (left < right) {
        const mid = Math.floor((left + right) / 2);
        const sum1 = isPrime(mid) ? mid : null;

        if (!isPrime(n - mid)) {
            left = mid + 1;
        } else {
            right = mid;
        }
    }

    return [sum1, n - sum1];
}
```