```javascript
function simulateUnbiasedCoinToss(tossBiased, numTosses) {
    let tosses = new Array(numTosses).fill(0);
    for (let i = 0; i < numTosses; i++) {
        // Calculate the expected value of the biased coin toss
        const expectedValue = (tossBiased === 0) ? 1 : 0;
        
        // Generate a random number between 0 and 1
        const randNum = Math.random();
        
        // If the random number is less than the expected value, return 1
        if (randNum < expectedValue) {
            tosses[i] = 1;
        } else {
            tosses[i] = 0;
        }
    }

    // Calculate the average of the simulated coin tosses to get an unbiased result
    const unbiasedTossResult = Math.round((tosses.reduce((a, b) => a + b, 0)) / numTosses);

    return unbiasedTossResult;
}
```