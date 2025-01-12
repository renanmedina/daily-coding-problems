```c
#include <stdio.h>
#include <math.h>

int expected_rounds(int n) {
    // The probability that a coin will be flipped an odd number of times is 1/2^n, and 
    // the probability that it will be flipped an even number of times is 1 - 1/2^n. 
    // Since we want only one coin to remain at the end, we can multiply these probabilities together.
    double prob_odd = 1 / pow(2.0, n);
    double prob_even = 1 - prob_odd;
    
    // For each odd round, there are n possible coins that could be left after this round. 
    // So the expected number of rounds for an odd round is n * (1/2^n).
    // We multiply by n because we have n possibilities.
    double expected_odd_rounds = n * pow(0.5, n);
    
    // For each even round, there are n-1 possible coins that could be left after this round, 
    // so the expected number of rounds for an even round is (n-1) * (1/2^n).
    double expected_even_rounds = (n - 1) * pow(0.5, n);
    
    // The expected total number of rounds is the sum of the expected rounds for odd and even rounds.
    return (double)(prob_odd * expected_odd_rounds + prob_even * expected_even_rounds) / (1 - pow(0.5, n));
}
```