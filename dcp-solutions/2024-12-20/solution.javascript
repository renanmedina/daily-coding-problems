```javascript
function sumOfPrimeNumbers(n) {
    function isPrime(num) {
        if (num < 2) return false;
        for (let i = 2; i <= Math.sqrt(num); i++) {
            if (num % i === 0) return false;
        }
        return true;
    }

    const primes = [];

    for (let possiblePrime = 2; possiblePrime * possiblePrime <= n; possiblePrime++) {
        if (isPrime(possiblePrime)) {
            while (n - possiblePrime * possiblePrime >= possiblePrime && isPrime(Math.floor((n - possiblePrime * possiblePrime) / possiblePrime))) {
                primes.push([possiblePrime, Math.floor((n - possiblePrime * possiblePrime) / possiblePrime)]);
            }
        }
    }

    return primes.sort((a, b) => a[0] - b[0] || a[1] - b[1])[0];
}
```