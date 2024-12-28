```c
#include <stdio.h>

int has_arbitrage(int rates[][2]) {
    int n = sizeof(rates) / sizeof(rates[0]);
    
    // check all possible pairs of currencies
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            if (i == j)
                continue;
            
            // find the minimum and maximum rates
            int min_rate, max_rate;
            int min_denom, max_denom;

            min_rate = rates[i][1];
            min_denom = rates[i][2];

            max_rate = rates[j][0];
            max_denom = rates[j][2];

            // find a common multiple of the denominations
            int common_denom = (min_denom * max_denom) / gcd(min_denom, max_denom);

            // check if we can make more currency by exchanging A units of i for B units of j with rate k
            for (int k = common_denom; k > 0; k /= rates[i][2]) {
                long long a_val = (long long)k * rates[i][1];
                long long b_val = (long long)k * rates[j][0];

                // if we can make more currency, return true
                if ((a_val % max_denom) < (b_val % max_denom)) {
                    return 1;
                }
            }

            // check for the other way around
            for (int k = common_denom; k > 0; k /= rates[j][2]) {
                long long a_val = (long long)k * rates[i][0];
                long long b_val = (long long)k * rates[j][1];

                // if we can make more currency, return true
                if ((a_val % min_denom) < (b_val % min_denom)) {
                    return 1;
                }
            }

            // check for direct trade with zero cost
            int a_val = rates[i][0];
            int b_val = rates[j][0];

            if (a_val > 0 && b_val > 0 && (long long)a_val * b_val == (long long)rates[i][1] * rates[j][2]) {
                return 1;
            }
        }
    }

    // no arbitrage found
    return 0;
}

int gcd(int a, int b) {
    if(b == 0)
        return a;
    else
        return gcd(b, a % b);
}
```