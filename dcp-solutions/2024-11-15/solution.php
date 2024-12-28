```php
function unbiased_coin_toss() {
    $coin_bias = rand(1, 1000000) / 1000000;
    $num_heads = 0;
    $num_tails = 0;

    for ($i = 0; $i < 10000; $i++) {
        if (toss_biased() == 0) {
            $num_heads++;
        } else {
            $num_tails++;
        }
    }

    $expected_heads = 5000;
    $expected_tails = 5000;

    $probability_of_heads = ($num_heads + 1) * ($expected_tails - $num_heads) / (($expected_heads - $num_heads) + ($expected_tails - $num_tails));
    $probability_of_heads *= $coin_bias;
    return toss_biased() == 0 ? $probability_of_heads : (1 - $probability_of_heads);
}
```