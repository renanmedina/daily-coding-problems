```javascript
function maxProfit(prices) {
    if (prices.length < 2) {
        return 0;
    }

    let minPrice = prices[0];
    let maxProfit = 0;

    for (let i = 1; i < prices.length; i++) {
        const currentPrice = prices[i];

        if (currentPrice < minPrice) {
            minPrice = currentPrice;
        } else {
            const profit = currentPrice - minPrice;
            maxProfit = Math.max(maxProfit, profit);
        }
    }

    return maxProfit;
}
```