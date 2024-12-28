```c
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define NUM_ITERATIONS 1000000
#define PI 3.14159265359

int main() {
    double sum = 0;

    for (int i = 0; i < NUM_ITERATIONS; i++) {
        double x = rand() / (double)RAND_MAX * 2 - 1;
        double y = rand() / (double)RAND_MAX * 2 - 1;
        if (x * x + y * y <= 1)
            sum++;
    }

    printf("%.3f\n", 4.0 * sum / NUM_ITERATIONS);
}
```