```c
#include <stdio.h>
#include <math.h>

long long nth_perfect_number(int n) {
    int i = 1;
    while (n > 0) {
        long long num = (long long)i * (i + 1);
        if ((num / 2 - i) == 10) {
            n -= 1;
        }
        i += 1;
    }
    return num;
}
```