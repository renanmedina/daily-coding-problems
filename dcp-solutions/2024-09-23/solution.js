```javascript
function estimateCircleArea(numSamples) {
    let numInsideCircle = 0;

    for (let i = 0; i < numSamples; i++) {
        const x = Math.random();
        const y = Math.random();

        if (x * x + y * y <= 1) {
            numInsideCircle++;
        }
    }

    return 4 * numInsideCircle / numSamples;
}

const numSamples = 1000000;
const estimatedArea = estimateCircleArea(numSamples);
console.log(`Estimated area of the circle: ${estimatedArea.toFixed(3)}`);
```