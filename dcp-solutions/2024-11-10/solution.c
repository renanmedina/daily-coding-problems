```c
int myPow(int x, int y) {
    if (y == 0)
        return 1;
    if (x == 0)
        return 0;

    long long res = 1;
    bool isNeg = (x < 0);
    x = abs(x);

    while(y > 0){
        if (y % 2 != 0) {
            res *= x;
        }
        y /= 2;
        x *= x;
    }

    return isNeg ? -res : res;
}
```