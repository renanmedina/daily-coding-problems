```python
def has_arbitrage(exchange_rates):
    """
    Determine whether there is a possible arbitrage in a currency exchange rate table.

    Args:
        exchange_rates (list of lists): A 2D array representing the currency exchange rates.

    Returns:
        bool: True if an arbitrage opportunity exists, False otherwise.
    """

    # Find all unique currencies
    currencies = set()
    for row in exchange_rates:
        for _ in row:
            currencies.add(row.index(_))
    
    # Initialize prices of each currency to 1
    prices = {i: 1 for i in currencies}

    # Iterate over the exchange rates to find arbitrage opportunities
    for i, (rate_from, rate_to) in enumerate(zip(exchange_rates, exchange_rates[1:], start=1)):
        from_currency, to_currency = currencies[i], currencies[i+1]
        prices[to_currency] *= 1/rate_from

    # Check if any price is infinite or negative
    for price in prices.values():
        if price == float('inf') or price < 0:
            return True

    # If no arbitrage opportunity exists, return False
    return False
```