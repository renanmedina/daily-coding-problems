```php
function maxProfit($prices) {
    if (empty($prices)) {
        return 0;
    }

    $minPrice = $prices[0];
    $maxProfit = 0;

    foreach ($prices as $price) {
        $minPrice = min($minPrice, $price);
        $maxProfit = max($maxProfit, $price - $minPrice);
    }

    return $maxProfit;
}
```