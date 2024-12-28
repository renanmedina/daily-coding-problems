```c
#include <stdio.h>

int climbStairs(int N, int X) {
    if (N == 0)
        return 1;
    
    int ways[N + 1];
    ways[0] = 1;
    
    for (int i = 1; i <= N; i++) {
        for (int x : X) {
            if (i >= x)
                ways[i] += ways[i - x];
        }
    }
    
    return ways[N];
}
```