```c
#include <stdbool.h>
#include <stdio.h>

bool is_prime(int num) {
    if (num <= 1) return false;
    if (num == 2) return true;
    if (num % 2 == 0) return false;
    int sqrt_num = (int)sqrt(num);
    for (int i = 3; i <= sqrt_num; i += 2)
        if (num % i == 0) return false;
    return true;
}

void goldbach(int n, bool (*is_prime)(int), int* a, int* b) {
    for (int i = 2; i < n / 2; ++i) {
        if (is_prime(i) && is_prime(n - i)) {
            *a = i;
            *b = n - i;
            return;
        }
    }
}

void solve() {
    int n;
    scanf("%d", &n);
    int a, b;
    goldbach(n, is_prime, &a, &b);
    printf("%d + %d = %d\n", a, b, n);
}
```