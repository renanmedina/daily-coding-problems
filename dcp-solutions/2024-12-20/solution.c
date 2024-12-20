```c
#include <stdbool.h>

bool is_prime(int num) {
    if (num <= 1) return false;
    if (num == 2) return true;
    if (num % 2 == 0) return false;
    for (int i = 3; i * i <= num; i += 2) {
        if (num % i == 0) return false;
    }
    return true;
}

bool is_goldbach(int n) {
    for (int i = 2; i < n / 2; i++) {
        if (is_prime(i) && is_prime(n - i)) return true;
    }
    return false;
}

void find_goldbach(int n, int* a, int* b) {
    for (int i = 2; i * i <= n / 2; i++) {
        if (n % i == 0 && is_prime(i) && is_prime(n - i)) {
            a[0] = i;
            b[0] = n - i;
            return;
        }
    }
}

int main() {
    int n;
    // assuming n will be passed as input here
    find_goldbach(n, &a, &b);
    printf("%d + %d = %d\n", a, b, a + b);
    return 0;
}
```