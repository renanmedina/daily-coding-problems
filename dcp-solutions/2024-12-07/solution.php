```php
function divide($dividend, $divisor) {
    // Determine the sign of the result
    $sign = ($dividend < 0) !== ($divisor < 0);

    // Convert both numbers to positive
    $dividend = abs($dividend);
    $divisor = abs($divisor);

    // Calculate the quotient using repeated subtraction
    $quotient = 0;
    while ($dividend >= $divisor) {
        $dividend -= $divisor;
        $quotient++;
    }

    return $sign ? -$quotient : $quotient;
}
```